import 'package:injectable/injectable.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/auth/domain/entities/login_form.dart';
import 'package:notes_app_with_ai/src/features/auth/infra/_barrel.dart';

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

    // todo: get real SessionToken

    // final responseCookies = response.headers['set-cookie'];
    // final maybeSessionToken = responseCookies?[0].split(';')[0];

    // if (maybeSessionToken == null) {
    //   final errMsg = 'Session token is null. Response: $logData'; // . Headers: ${response.headers}
    //   log.severe(errMsg);
    //   throw ServerException(description: errMsg);
    // }

    // log.finest('Session token: $maybeSessionToken');
    // return maybeSessionToken;

    return 'null';
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
    await inject<SecureStorageService>().addValue<String>(
      SecureStorageConstants.accessTokenKey,
      sessionToken,
    );
  }

  @override
  Future<void> deleteSessionToken() async {
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
