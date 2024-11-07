import 'package:dartz/dartz.dart' hide State;
import 'package:notes_app_with_ai/src/core/error/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/_barrel.dart';

abstract interface class INoteRepository {
  // Send Tasks

  Future<Either<Failure, String>> sendAudioFileTask(String audioFilePath, NoteLanguage language);

  Future<Either<Failure, String>> sendYoutubeTask(String youtubeUrl, NoteLanguage language);

  Future<Either<Failure, Note>> getTaskResult(String taskId);

  // Notes Store

  Future<Either<Failure, int>> storeNote(Note note);

  Future<Either<Failure, Note>> readNote(int id);

  Future<Either<Failure, List<Note>>> readAllNotes();

  Future<Either<Failure, bool>> deleteNote(int id);

  // Expected Tasks Store

  Future<Either<Failure, int>> storeExpectedTask(String taskId);

  Future<Either<Failure, List<String>>> readAllExpectedTaskIds();

  Future<Either<Failure, List<int>>> findExpectedTask(String taskId);

  Future<Either<Failure, bool>> deleteExpectedTask(int id);
}
