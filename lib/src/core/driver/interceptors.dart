import 'package:dio/dio.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';

/// Authorizing Intersceptor. Inject accessToken to headers.authorization.
class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final storage = inject<SecureStorageService>();
    final accessToken = await storage.getValue<String>(SecureStorageConstants.accessTokenKey);

    if (accessToken != null && accessToken.isNotEmpty) {
      // options.headers['Authorization'] = accessToken; // 'Bearer'

      options.headers['Cookie'] = accessToken;
    }

    super.onRequest(options, handler);
  }
}

/// Logging Interseptor. Outputs URLs, headers, and data on request.
class InfoInterceptor extends Interceptor {
  static final _log = MyWebLogger('DioLoggerInterceptor');

  static MapEntry<String, String> _getStringMapEntry(key, value) => MapEntry(key.toString(), value.toString());

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final logHeaders = options.headers.map(_getStringMapEntry); // .entries.map((e) => _logLine(e.key, e.value));

    Map<String, String> logFields = {};

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
    }

    _log.info(
      '${options.method} Request:'
      '\n - URL: ${options.uri}'
      '\n - Headers: $logHeaders'
      '\n - Data: $logFields',
    );

    super.onRequest(options, handler);
  }
}
