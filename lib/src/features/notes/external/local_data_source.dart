import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/domain/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/infra/_barrel.dart';

@Singleton(as: INoteLocalDataSource)
final class NoteLocalDataSourceImpl implements INoteLocalDataSource {
  const NoteLocalDataSourceImpl();

  @override
  Future<Id> storeNote(Note note) async {
    final log = Logger('NoteLocalDataSource.storeNote');
    final storage = inject<LocalNotesStorage>();
    final id = await storage.addNote(note);

    log.finest("Note '${note.title}' has been saved with ID = $id");

    return id;
  }

  @override
  Future<NoteCollection> readNote(int id) async {
    final log = Logger('NoteLocalDataSource.readNote');
    final storage = inject<LocalNotesStorage>();
    final maybeNote = await storage.readNote(id);

    if (maybeNote == null) {
      final msg = 'Attempting to read a nonexistent note from the repository, ID = $id';

      log.severe(msg);
      throw CacheException(description: msg);
    }

    log.finest('Loaded Note with ID = $id from the vault.');

    return maybeNote;
  }

  @override
  Future<List<NoteCollection>> readAllNotes() async {
    final log = Logger('NoteLocalDataSource.readAllNotes');
    final storage = inject<LocalNotesStorage>();
    final notes = await storage.readAllNotes();

    log.finest('Loaded ${notes.length} Notes from the vault.');

    return notes;
  }

  @override
  Future<bool> deleteNote(int id) async {
    final log = Logger('NoteLocalDataSource.deleteNote');
    final storage = inject<LocalNotesStorage>();

    final result = await storage.deleteNote(id);

    if (result) {
      log.finest('Deleted Note with ID = $id from the vault.');
    } else {
      log.warning("Doesn't delete Note with ID = $id from the vault.");
    }

    return result;
  }

  @override
  Future<Id> storeExpectedTaskId(String taskId) async {
    final log = Logger('NoteLocalDataSource.storeExpectedTaskId');
    final storage = inject<LocalExpectedTasksStorage>();
    final id = await storage.addExpectedTask(taskId);

    log.finest("Expected Task with ID = '$taskId' has been saved with ID = $id");

    return id;
  }

  @override
  Future<List<ExpectedTaskCollection>> readAllExpectedTasks() async {
    final log = Logger('NoteLocalDataSource.readExpectedTasks');
    final storage = inject<LocalExpectedTasksStorage>();
    final expectedTasks = await storage.readAllExpectedTasks();

    log.finest('Loaded ${expectedTasks.length} ExpectedTaskIds from the vault.');

    return expectedTasks;
  }

  @override
  Future<List<ExpectedTaskCollection>> findExpectedTasks(String taskId) async {
    final log = Logger('NoteLocalDataSource.findExpectedTasks');
    final storage = inject<LocalExpectedTasksStorage>();
    final expectedTasks = await storage.findExpectedTasks(taskId);

    log.finest('Loaded ${expectedTasks.length} ExpectedTaskIds from the vault.');

    return expectedTasks;
  }

  @override
  Future<bool> deleteExpectedTask(int id) async {
    final log = Logger('NoteLocalDataSource.deleteExpectedTask');
    final storage = inject<LocalExpectedTasksStorage>();
    final result = await storage.deleteExpectedTask(id);

    if (result) {
      log.finest('Deleted ExpectedTask with ID = $id from the vault.');
    } else {
      log.warning("Doesn't delete ExpectedTask with ID = $id from the vault.");
    }

    return result;
  }
}
