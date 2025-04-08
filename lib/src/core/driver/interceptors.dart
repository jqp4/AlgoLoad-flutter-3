// todo: fix import
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Authorizing Intersceptor. Inject accessToken to headers.authorization.
class AuthInterceptor extends Interceptor {
  // Добавляем переменную для хранения последнего известного cookie
  String? _lastKnownCookie;
  static final _log = MyWebLogger('AuthInterceptor');

  // todo: remove
  // Публичный метод для обновления последнего известного cookie
  @Deprecated('cringe')
  void updateLastKnownCookie(String? cookie) {
    _log.info('Updating last known cookie to: $cookie');
    _lastKnownCookie = cookie;
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await _getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      // options.headers['Authorization'] = accessToken; // 'Bearer'
      _log.info('Setting Cookie header: $accessToken');
      options.headers['Cookie'] = accessToken;
    } else {
      _log.warning('No access token available for request to ${options.uri}');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kIsWeb) {
      final cookies = response.headers['set-cookie'];
      _log.info('Response headers: ${response.headers}');
      _log.info('Response cookies: $cookies');
      _log.info('html.document.cookie: ${html.document.cookie}');

      if (cookies != null && cookies.isNotEmpty) {
        // Извлекаем сессионный токен из заголовка set-cookie
        final sessionCookie = cookies[0].split(';')[0];
        _log.info('Extracted session cookie: $sessionCookie');

        // Сохраняем cookie для использования в будущих запросах
        _lastKnownCookie = sessionCookie;

        // Пытаемся установить cookie вручную
        // try {
        //   html.document.cookie = sessionCookie;
        //   _log.info('Manually set document.cookie to: $sessionCookie');
        //   _log.info('Current document.cookie after setting: ${html.document.cookie}');
        // } catch (e) {
        //   _log.severe('Error setting document.cookie: $e');
        // }
      }
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log.severe('Request error: ${err.message}');
    if (err.response != null) {
      _log.severe('Response status: ${err.response?.statusCode}');
      _log.severe('Response headers: ${err.response?.headers}');
    }
    super.onError(err, handler);
  }

  Future<String?> _getAccessToken() async {
    late final String? accessToken;
    _log.info('Getting access token...');

    if (kIsWeb) {
      // example of token
      // session=.eJwlzjsOwjAMANC7ZGZw4m96mSpxbJW1pRPi7iDxTvDeZc8zrqNsr_OOR9mfq2wlY7rqmCvXqmEQgAGZ0d1CE51B1ZAkJgIEzyrVRLhP7FWjN1Cy3kfaVFLRpsuFKgs34gE-vWHrhuAZtQI60ZCxkp0MBwOUX-S-4vxvsHy-42QuuA.Z0h9GA.pt13d166lL-9w1aUPAs5ETuM6pA

      // Сначала проверяем сохраненный cookie
      if (_lastKnownCookie != null && _lastKnownCookie!.isNotEmpty) {
        _log.info('Using last known cookie: $_lastKnownCookie');
        return _lastKnownCookie;
      }

      // Затем проверяем document.cookie
      final globalCookies = html.document.cookie;
      _log.info('!!! Current document.cookie: $globalCookies');

      if (globalCookies != null && globalCookies.isNotEmpty) {
        accessToken = globalCookies.split(';')[0];
        _log.info('Using cookie from document.cookie: $accessToken');
      } else {
        _log.warning('No cookies found in document.cookie');
        accessToken = null;
      }
    } else {
      final storage = inject<SecureStorageService>();
      accessToken = await storage.getValue<String>(SecureStorageConstants.accessTokenKey);
      _log.info('Using access token from secure storage: $accessToken');
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
