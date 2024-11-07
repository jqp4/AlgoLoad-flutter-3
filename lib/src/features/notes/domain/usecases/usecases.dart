import 'package:dartz/dartz.dart' hide State;
import 'package:injectable/injectable.dart';
import 'package:notes_app_with_ai/src/core/error/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/_barrel.dart';
import 'package:notes_app_with_ai/src/foundation/extensoins/either.dart';

abstract class NoteUseCasePrototype {
  const NoteUseCasePrototype(this.noteRepository);

  final INoteRepository noteRepository;
}

@singleton
class SendAudioFileTask extends NoteUseCasePrototype {
  const SendAudioFileTask(super.noteRepository);

  Future<Either<Failure, void>> call(String audioFilePath, NoteLanguage language) async {
    final maybeTaskId = await noteRepository.sendAudioFileTask(audioFilePath, language);
    if (maybeTaskId.isLeft()) return maybeTaskId;

    final maybeStored = await noteRepository.storeExpectedTask(maybeTaskId.asRight());
    if (maybeStored.isLeft()) return maybeStored;

    return const Right(null);
  }
}

@singleton
class SendYoutubeTask extends NoteUseCasePrototype {
  const SendYoutubeTask(super.noteRepository);

  Future<Either<Failure, dynamic>> call(String youtubeUrl, NoteLanguage language) async {
    final maybeTaskId = await noteRepository.sendYoutubeTask(youtubeUrl, language);
    if (maybeTaskId.isLeft()) return maybeTaskId;

    final maybeStored = await noteRepository.storeExpectedTask(maybeTaskId.asRight());
    if (maybeStored.isLeft()) return maybeStored;

    return const Right(null);
  }
}

@singleton
class FetchExpectedNote extends NoteUseCasePrototype {
  const FetchExpectedNote(super.noteRepository);

  Future<Either<Failure, dynamic>> call(String taskId) async {
    final maybeNote = await noteRepository.getTaskResult(taskId);
    if (maybeNote.isLeft()) return maybeNote;

    final maybeNoteId = await noteRepository.storeNote(maybeNote.asRight());
    if (maybeNoteId.isLeft()) return maybeNoteId;

    final maybeTaskIdsToDelete = await noteRepository.findExpectedTask(taskId);
    if (maybeTaskIdsToDelete.isLeft()) return maybeTaskIdsToDelete;

    final results = await Future.wait(
      maybeTaskIdsToDelete.asRight().map(noteRepository.deleteExpectedTask).toList(),
    );

    final failures = results.where((e) => e.isLeft()).toList();
    if (failures.isNotEmpty) return failures[0];
    // Logger('FetchExpectedNote_UseCase').warning('${failures.length} taskIds are not deleted');

    return const Right(null);
  }
}

@singleton
class ReadNote extends NoteUseCasePrototype {
  const ReadNote(super.noteRepository);

  Future<Either<Failure, Note>> call(int noteStorageId) async {
    return noteRepository.readNote(noteStorageId);
  }
}

@singleton
class ReadAllNotes extends NoteUseCasePrototype {
  const ReadAllNotes(super.noteRepository);

  Future<Either<Failure, List<Note>>> call() async {
    return noteRepository.readAllNotes();
  }
}

@singleton
class ReadAllExpectedTaskIds extends NoteUseCasePrototype {
  const ReadAllExpectedTaskIds(super.noteRepository);

  Future<Either<Failure, List<String>>> call() async {
    return noteRepository.readAllExpectedTaskIds();
  }
}

@singleton
class CopyNote extends NoteUseCasePrototype {
  const CopyNote(super.noteRepository);

  Future<Either<Failure, int>> call(int noteStorageId) async {
    final maybeNote = await noteRepository.readNote(noteStorageId);
    if (maybeNote.isLeft()) return Left(maybeNote.asLeft());

    final note = maybeNote.asRight();
    final copiedNote = note.copyWith(
      title: '(Copy) ${note.title}',
      creationDate: DateTime.now(),
    );

    final maybeCopiedNoteId = await noteRepository.storeNote(copiedNote);
    return maybeCopiedNoteId;
  }
}

@singleton
class DeleteNote extends NoteUseCasePrototype {
  const DeleteNote(super.noteRepository);

  Future<Either<Failure, bool>> call(int noteStorageId) async {
    final maybeDeleted = await noteRepository.deleteNote(noteStorageId);
    return maybeDeleted;
  }
}
