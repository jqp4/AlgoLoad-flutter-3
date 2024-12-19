import 'package:algoload_flutter_web_app/src/core/error/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes/_barrel.dart';
import 'package:dartz/dartz.dart' hide State;

abstract interface class INoteRepository {
  // Send Tasks

  Future<Either<Failure, String>> sendAudioFileTask(String audioFilePath, NoteLanguage language);

  Future<Either<Failure, String>> sendYoutubeTask(String youtubeUrl, NoteLanguage language);

  Future<Either<Failure, Note>> getTaskResult(String taskId);
}
