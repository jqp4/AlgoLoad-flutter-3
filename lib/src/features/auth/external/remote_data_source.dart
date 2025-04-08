// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

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
      '/app/login',
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

    // Извлекаем сессионный токен из заголовка set-cookie
    final responseCookies = response.headers['set-cookie'];
    log.info('Response cookies: $responseCookies');

    final maybeSessionToken = responseCookies?[0].split(';')[0];

    if (maybeSessionToken == null) {
      final errMsg = 'Session token is null. Response: $logData. Headers: ${response.headers}';
      log.severe(errMsg);
      throw ServerException(description: errMsg);
    }

    log.finest('Session token: $maybeSessionToken');
    return maybeSessionToken;
  }

  @override
  Future<void> logoutUser() async {
    final log = MyWebLogger('AuthRemoteDataSourceImpl.logoutUser');
    final client = inject<NetworkDriver>();
    const fineStatusCodes = [200];

    final response = await client.get('/app/logout');

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
        html.document.cookie = sessionToken;
        log.info('Set document.cookie to: $sessionToken');
        log.info('Current document.cookie after setting: ${html.document.cookie}');
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
    // todo: облагородить для web
    if (kIsWeb) {
      final log = MyWebLogger('AuthRemoteDataSourceImpl.deleteSessionToken');
      log.info('Deleting session token for web');

      try {
        // Устанавливаем пустое значение cookie или с истекшим сроком действия
        html.document.cookie = 'session=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
        log.info('Session cookie deleted. Current document.cookie: ${html.document.cookie}');
      } catch (e) {
        log.severe('Error deleting document.cookie: $e');
      }
      return;
    }

    await inject<SecureStorageService>().deleteValue(
      SecureStorageConstants.accessTokenKey,
    );
  }

  // @override
  // Future<String> sendAudioFileTask(String audioFilePath, NoteLanguage language) async {
  //   final log = MyWebLogger('NoteRemoteDataSource.sendAudioFileTask');
  //   final client = inject<NetworkDriver>();
  //   const fineStatusCode = 200;

  //   final response = await client.uploadFile(
  //     '/audio_task',
  //     audioFilePath,
  //     body: {
  //       'lang': const NoteLanguageSerializer().toJson(language),
  //     },
  //   );

  //   final rawData = response.data;
  //   final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

  //   if (response.statusCode == fineStatusCode) {
  //     final msg = 'Response $logData';
  //     log.finest(msg);

  //     final data = rawData['data'] as Map<String, dynamic>;
  //     final taskId = _safetySerialization(() => data['taskId'] as String);
  //     return taskId;
  //   } else {
  //     final msg = 'ServerException: $logData';
  //     log.severe(msg);

  //     throw ServerException(description: msg);
  //   }
  // }

  // @override
  // Future<String> sendYoutubeTask(String youtubeUrl, NoteLanguage language) async {
  //   final log = MyWebLogger('NoteRemoteDataSource.sendYoutubeTask');
  //   final client = inject<NetworkDriver>();
  //   const fineStatusCode = 200;

  //   final response = await client.post(
  //     '/youtube_task',
  //     body: {
  //       'youtubeUrl': youtubeUrl,
  //       'lang': const NoteLanguageSerializer().toJson(language),
  //     },
  //   );

  //   final rawData = response.data;
  //   final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

  //   if (response.statusCode == fineStatusCode) {
  //     final msg = 'Response $logData';
  //     log.finest(msg);

  //     final data = rawData['data'] as Map<String, dynamic>;
  //     final taskId = _safetySerialization(() => data['taskId'] as String);
  //     return taskId;
  //   } else {
  //     final msg = 'ServerException: $logData';
  //     log.severe(msg);

  //     throw ServerException(description: msg);
  //   }
  // }

  // @override
  // Future<NoteDto> getTaskResult(String taskId) async {
  //   final log = MyWebLogger('NoteRemoteDataSource.getTaskResult');
  //   final client = inject<NetworkDriver>();
  //   const fineStatusCode = 200;

  //   final response = await client.post(
  //     '/result_task',
  //     body: {
  //       'taskId': taskId,
  //     },
  //   );

  //   final rawData = response.data;
  //   final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

  //   if (response.statusCode == fineStatusCode) {
  //     final msg = 'Response $logData';
  //     log.finest(msg);

  //     final data = rawData['data'] as Map<String, dynamic>;
  //     final noteDto = _safetySerialization(() => NoteDto.fromJson(data));
  //     return noteDto;
  //   } else {
  //     final msg = 'ServerException: $logData';
  //     log.severe(msg);

  //     throw ServerException(description: msg);
  //   }
  // }

  // // Helper
  // T _safetySerialization<T>(T Function() serialization) {
  //   final log = MyWebLogger('AuthRemoteDataSourceImpl._safetySerialization');

  //   try {
  //     return serialization();
  //     // ignore: avoid_catching_errors
  //   } on Error catch (e, t) {
  //     final msg = 'SerializationException: $e, \ntrace = $t';
  //     log.severe(msg);

  //     throw SerializationException(description: msg);
  //   }
  // }
}
