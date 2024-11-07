import 'package:isar/isar.dart';
import 'package:notes_app_with_ai/src/core/error/exception.dart';
import 'package:notes_app_with_ai/src/features/notes/domain/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/infra/_barrel.dart';

/// Throws a [CacheException] for all error codes.
abstract interface class INoteLocalDataSource {
  /// Stores the [Note] to the database.
  Future<Id> storeNote(Note note);

  /// Returns note stored in the database by id.
  Future<NoteCollection> readNote(int id);

  /// Returns all notes stored in the database.
  Future<List<NoteCollection>> readAllNotes();

  /// Delete the [Note] from the database.
  Future<bool> deleteNote(int id);

  /// Stores the task ID of the task in the job
  Future<Id> storeExpectedTaskId(String taskId);

  /// Returns all task in the job stored in the database.
  Future<List<ExpectedTaskCollection>> readAllExpectedTasks();

  /// Returns all task with equal taskId stored in the database.
  Future<List<ExpectedTaskCollection>> findExpectedTasks(String taskId);

  /// Delete the expected task from the database.
  Future<bool> deleteExpectedTask(int id);
}
