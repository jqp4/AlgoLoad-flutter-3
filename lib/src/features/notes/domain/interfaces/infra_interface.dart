import 'package:dartz/dartz.dart' hide State;
import 'package:notes_app_with_ai/src/core/error/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/_barrel.dart';

abstract interface class INoteRepository {
  // Send Tasks

  Future<Either<Failure, String>> sendAudioFileTask(String audioFilePath, NoteLanguage language);

  Future<Either<Failure, String>> sendYoutubeTask(String youtubeUrl, NoteLanguage language);

  Future<Either<Failure, Note>> getTaskResult(String taskId);
}
