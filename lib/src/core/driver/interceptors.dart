// todo: fix import
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Authorizing Intersceptor. Inject accessToken to headers.authorization.
class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      // options.headers['Authorization'] = accessToken; // 'Bearer'

      options.headers['Cookie'] = accessToken;
    }

    super.onRequest(options, handler);
  }

  Future<String?> _getAccessToken() async {
    late final String? accessToken;

    if (kIsWeb) {
      final globalCookies = html.document.cookie;

      // example
      // session=.eJwlzjsOwjAMANC7ZGZw4m96mSpxbJW1pRPi7iDxTvDeZc8zrqNsr_OOR9mfq2wlY7rqmCvXqmEQgAGZ0d1CE51B1ZAkJgIEzyrVRLhP7FWjN1Cy3kfaVFLRpsuFKgs34gE-vWHrhuAZtQI60ZCxkp0MBwOUX-S-4vxvsHy-42QuuA.Z0h9GA.pt13d166lL-9w1aUPAs5ETuM6pA

      accessToken = globalCookies?.split(';')[0];
    } else {
      final storage = inject<SecureStorageService>();
      accessToken = await storage.getValue<String>(SecureStorageConstants.accessTokenKey);
    }

    return accessToken;
  }
}

/// Logging Interseptor. Outputs URLs, headers, and data on request.
class InfoInterceptor extends Interceptor {
  static final _log = MyWebLogger('DioLoggerInterceptor');

  static MapEntry<String, String> _getStringMapEntry(key, value) => MapEntry(key.toString(), value.toString());

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final logHeaders = options.headers.map(_getStringMapEntry);
    Map<String, String>? logFields;

    if (options.method == 'POST') {
      if (options.data is FormData) {
        logFields = {}
          ..addEntries((options.data as FormData).fields)
          ..addEntries((options.data as FormData).files.map((e) => _getStringMapEntry(e.key, e.value.filename)));
      } else if (options.data is Map) {
        logFields = (options.data as Map).map(_getStringMapEntry);
      } else {
        const msgKey = 'InfoInterceptor TypeError';
        final msgValue = 'options.data.runtimeType = ${options.data.runtimeType}';

        _log.warning('$msgKey: $msgValue');
        logFields = {msgKey: msgValue};
      }
    } else {}

    _log.info(
      '${options.method} Request:'
      '\n - URL: ${options.uri}'
      '\n - Data: $logFields'
      '\n - Headers: $logHeaders',
    );

    super.onRequest(options, handler);
  }
}
