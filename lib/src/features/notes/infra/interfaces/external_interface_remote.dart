import 'package:algoload_flutter_web_app/src/features/notes/domain/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes/infra/_barrel.dart';

abstract interface class INoteRemoteDataSource {
  Future<String> sendAudioFileTask(String audioFilePath, NoteLanguage language);

  Future<String> sendYoutubeTask(String youtubeUrl, NoteLanguage language);

  Future<NoteDto> getTaskResult(String taskId);
}
