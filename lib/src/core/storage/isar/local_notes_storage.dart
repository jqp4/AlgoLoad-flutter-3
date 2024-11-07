import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/domain/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/infra/_barrel.dart';

@singleton
class LocalNotesStorage {
  late final Isar _isar;

  Future<void> init() async {
    _isar = await inject<IsarManager>().openIsar(
      IsarNames.notes,
      NoteCollectionSchema,
    );
  }

  @disposeMethod
  Future<void> dispose() async {
    await inject<IsarManager>().closeIsar(_isar);
  }

  Future<Id> addNote(Note note) async {
    return _isar.writeTxn(() => _isar.noteCollections.put(note.toCollection()));
  }

  Future<void> updateNote(Id id, Note updatedNote) async {
    final maybeExistingNoteCollection = await _isar.noteCollections.get(id);
    if (maybeExistingNoteCollection == null) return;

    final updatedNoteCollection = updatedNote.toCollection()..id = id;
    await _isar.writeTxn(() => _isar.noteCollections.put(updatedNoteCollection));
  }

  Future<bool> deleteNote(Id id) async {
    return _isar.writeTxn(() => _isar.noteCollections.delete(id));
  }

  Future<NoteCollection?> readNote(Id id) async {
    final maybeExistingNoteCollection = await _isar.noteCollections.get(id);
    return maybeExistingNoteCollection;
  }

  Future<List<NoteCollection>> readAllNotes() async {
    return _isar.txn(() => _isar.noteCollections.where().findAll());
  }
}
