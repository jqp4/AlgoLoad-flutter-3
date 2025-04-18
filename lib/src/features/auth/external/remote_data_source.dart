import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/domain/entities/login_form.dart';
import 'package:algoload_flutter_web_app/src/features/auth/infra/_barrel.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IAuthRemoteDataSource)
final class AuthRemoteDataSourceImpl implements IAuthRemoteDataSource {
  const AuthRemoteDataSourceImpl();

  @override
  Future<String> loginUser(LoginForm form) async {
    final log = MyWebLogger('AuthRemoteDataSourceImpl.loginUser');
    final client = inject<NetworkDriver>();
    const fineStatusCodes = [302, 200]; // todo: remove 302 ?

    final response = await client.post(
      '/api/login',
      body: {
        'username': form.userName,
        'password': form.userPassword,
        'submit': form.submitText,
      },
    );

    final rawData = response.data;
    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (!fineStatusCodes.contains(response.statusCode)) {
      final errMsg = 'ServerException: $logData';
      log.severe(errMsg);

      throw ServerException(description: errMsg);
    }

    final msg = 'Response: $logData';
    log.finest(msg);

    return 'null';

    // todo: In the current version, authorization no longer explicitly uses the session token.

    // // Извлекаем сессионный токен из заголовка set-cookie
    // final responseCookies = response.headers['set-cookie'];
    // // log.info('Response cookies: $responseCookies');
    // // log.info('All headers: ${response.headers}');

    // // Проверяем наличие cookies в ответе
    // if (responseCookies == null || responseCookies.isEmpty) {
    //   // Если авторизация успешна, но токен отсутствует в заголовке,
    //   // это может быть связано с блокировкой SameSite=Lax
    //   // Попробуем извлечь информацию о сессии из тела ответа
    //   if (rawData is Map && rawData.containsKey('result') && rawData['result'] == 'Authorized successfully') {
    //     // Создаем фиктивный токен, который будет использоваться для последующих запросов
    //     // AuthInterceptor будет использовать этот токен для установки Cookie заголовка
    //     const sessionToken = 'session=authorized_session';
    //     log.info('Created placeholder session token: $sessionToken');
    //     return sessionToken;
    //   }

    //   final errMsg = 'Session token is null. Response: $logData. Headers: ${response.headers}';
    //   log.severe(errMsg);

    //   // todo: ???
    //   // throw ServerException(description: errMsg);
    //   return 'null';
    // }

    // // Извлекаем полный токен сессии из заголовка
    // final fullSessionCookie = responseCookies[0];
    // log.info('Full session cookie: $fullSessionCookie');

    // // Извлекаем только часть session=value без атрибутов
    // final maybeSessionToken = fullSessionCookie.split(';')[0];

    // if (maybeSessionToken.isEmpty) {
    //   final errMsg = 'Session token is empty. Response: $logData. Headers: ${response.headers}';
    //   log.severe(errMsg);

    //   // todo: ???
    //   // throw ServerException(description: errMsg);
    //   return 'null';
    // }

    // log.finest('Session token: $maybeSessionToken');
    // return maybeSessionToken;
  }

  @override
  Future<void> logoutUser() async {
    final log = MyWebLogger('AuthRemoteDataSourceImpl.logoutUser');
    final client = inject<NetworkDriver>();
    const fineStatusCodes = [200];

    final response = await client.get('/api/logout');

    final rawData = response.data;
    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (!fineStatusCodes.contains(response.statusCode)) {
      final errMsg = 'ServerException: $logData';
      log.severe(errMsg);

      throw ServerException(description: errMsg);
    }

    final msg = 'Response: $logData';
    log.finest(msg);
  }

  @override
  Future<void> storeSessionToken(String sessionToken) async {
    final log = MyWebLogger('AuthRemoteDataSourceImpl.storeSessionToken');
    log.info('Storing session token: $sessionToken');

    if (kIsWeb) {
      // Для веб-версии пытаемся установить cookie напрямую
      try {
        // Проверяем, содержит ли токен атрибуты SameSite, Path и т.д.
        // Если да, то извлекаем только часть session=value
        // final cleanToken = sessionToken.contains(';') ? sessionToken.split(';')[0] : sessionToken;

        // html.document.cookie = cleanToken;
        // log.info('Set document.cookie to: $cleanToken');
        // log.info('Current document.cookie after setting: ${html.document.cookie}');

        // Сохраняем токен также в AuthInterceptor через NetworkDriver
        // final client = inject<NetworkDriver>();
        // if (client is NetworkDriver) {
        //   for (final interceptor in client._dio.interceptors) {
        //     if (interceptor is AuthInterceptor) {
        //       interceptor.updateLastKnownCookie(cleanToken);
        //       log.info('Updated AuthInterceptor with token');
        //       break;
        //     }
        //   }
        // }
      } catch (e) {
        log.severe('Error setting document.cookie: $e');
      }
      return;
    }

    await inject<SecureStorageService>().addValue<String>(
      SecureStorageConstants.accessTokenKey,
      sessionToken,
    );
  }

  @override
  Future<void> deleteSessionToken() async {
    if (kIsWeb) {
      final log = MyWebLogger('AuthRemoteDataSourceImpl.deleteSessionToken');
      log.info('Deleting session token for web');

      try {
        // Устанавливаем пустое значение cookie с истекшим сроком действия
        // html.document.cookie = 'session=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
        // log.info('Session cookie deleted. Current document.cookie: ${html.document.cookie}');

        // Очищаем также токен в AuthInterceptor
        // final client = inject<NetworkDriver>();
        // if (client is NetworkDriver) {
        //   for (final interceptor in client._dio.interceptors) {
        //     if (interceptor is AuthInterceptor) {
        //       interceptor.updateLastKnownCookie(null);
        //       log.info('Cleared AuthInterceptor token');
        //       break;
        //     }
        //   }
        // }
      } catch (e) {
        log.severe('Error deleting document.cookie: $e');
      }
      return;
    }

    await inject<SecureStorageService>().deleteValue(
      SecureStorageConstants.accessTokenKey,
    );
  }

  @override
  Future<String> getUserName() async {
    final log = MyWebLogger('AuthRemoteDataSourceImpl.getUserName');
    final client = inject<NetworkDriver>();
    const fineStatusCodes = [200];

    final response = await client.get('/api/username');

    final rawData = response.data;
    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (!fineStatusCodes.contains(response.statusCode)) {
      final errMsg = 'ServerException: $logData';
      log.severe(errMsg);
      throw ServerException(description: errMsg);
    }

    final msg = 'Response: $logData';
    log.finest(msg);

    if (rawData is Map && rawData.containsKey('result')) {
      return rawData['result'].toString();
    } else {
      final errMsg = 'Username not found in response: $logData';
      log.severe(errMsg);
      throw ServerException(description: errMsg);
    }
  }
}
