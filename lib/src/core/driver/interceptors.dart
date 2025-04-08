// todo: fix import
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Authorizing Intersceptor. Inject accessToken to headers.authorization.
class AuthInterceptor extends Interceptor {
  String? _lastKnownCookie;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (kIsWeb) {
      final currentCookie = html.document.cookie;
      if (currentCookie != _lastKnownCookie) {
        _lastKnownCookie = currentCookie;
      }

      if (_lastKnownCookie != null && _lastKnownCookie!.isNotEmpty) {
        options.headers['Cookie'] = _lastKnownCookie;
      } else {
        options.headers['Cookie'] = '123';
      }
    } else {
      final storage = inject<SecureStorageService>();
      final accessToken = await storage.getValue<String>(SecureStorageConstants.accessTokenKey);
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Cookie'] = accessToken;
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kIsWeb) {
      final cookies = response.headers['set-cookie'];
      if (cookies != null && cookies.isNotEmpty) {
        _lastKnownCookie = cookies[0].split(';')[0];
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kIsWeb && err.response?.statusCode == 401) {
      _lastKnownCookie = null;
    }
    super.onError(err, handler);
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
