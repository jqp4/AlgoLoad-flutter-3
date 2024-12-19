import 'package:injectable/injectable.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/domain/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/infra/_barrel.dart';

@Singleton(as: INoteRemoteDataSource)
final class NoteRemoteDataSourceImpl implements INoteRemoteDataSource {
  const NoteRemoteDataSourceImpl();

  @override
  Future<String> sendAudioFileTask(String audioFilePath, NoteLanguage language) async {
    final log = MyWebLogger('NoteRemoteDataSource.sendAudioFileTask');
    final client = inject<NetworkDriver>();
    const fineStatusCode = 200;

    final response = await client.uploadFile(
      '/audio_task',
      filePath: audioFilePath,
      fileFieldName: 'file_data',
      body: {
        'lang': const NoteLanguageSerializer().toJson(language),
      },
    );

    final rawData = response.data;
    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (response.statusCode == fineStatusCode) {
      final msg = 'Response $logData';
      log.finest(msg);

      final data = rawData['data'] as Map<String, dynamic>;
      final taskId = _safetySerialization(() => data['taskId'] as String);
      return taskId;
    } else {
      final msg = 'ServerException: $logData';
      log.severe(msg);

      throw ServerException(description: msg);
    }
  }

  @override
  Future<String> sendYoutubeTask(String youtubeUrl, NoteLanguage language) async {
    final log = MyWebLogger('NoteRemoteDataSource.sendYoutubeTask');
    final client = inject<NetworkDriver>();
    const fineStatusCode = 200;

    final response = await client.post(
      '/youtube_task',
      body: {
        'youtubeUrl': youtubeUrl,
        'lang': const NoteLanguageSerializer().toJson(language),
      },
    );

    final rawData = response.data;
    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (response.statusCode == fineStatusCode) {
      final msg = 'Response $logData';
      log.finest(msg);

      final data = rawData['data'] as Map<String, dynamic>;
      final taskId = _safetySerialization(() => data['taskId'] as String);
      return taskId;
    } else {
      final msg = 'ServerException: $logData';
      log.severe(msg);

      throw ServerException(description: msg);
    }
  }

  @override
  Future<NoteDto> getTaskResult(String taskId) async {
    final log = MyWebLogger('NoteRemoteDataSource.getTaskResult');
    final client = inject<NetworkDriver>();
    const fineStatusCode = 200;

    final response = await client.post(
      '/result_task',
      body: {
        'taskId': taskId,
      },
    );

    final rawData = response.data;
    final logData = '(${response.statusCode}): <${rawData.runtimeType}>$rawData';

    if (response.statusCode == fineStatusCode) {
      final msg = 'Response $logData';
      log.finest(msg);

      final data = rawData['data'] as Map<String, dynamic>;
      final noteDto = _safetySerialization(() => NoteDto.fromJson(data));
      return noteDto;
    } else {
      final msg = 'ServerException: $logData';
      log.severe(msg);

      throw ServerException(description: msg);
    }
  }

  // Helper
  T _safetySerialization<T>(T Function() serialization) {
    final log = MyWebLogger('NoteRemoteDataSource._safetySerialization');

    try {
      return serialization();
      // ignore: avoid_catching_errors
    } on Error catch (e, t) {
      final msg = 'SerializationException: $e, \ntrace = $t';
      log.severe(msg);

      throw SerializationException(description: msg);
    }
  }
}
