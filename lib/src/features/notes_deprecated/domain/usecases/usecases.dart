import 'package:algoload_flutter_web_app/src/core/error/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes_deprecated/_barrel.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:injectable/injectable.dart';

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

    // final maybeStored = await noteRepository.storeExpectedTask(maybeTaskId.asRight());
    // if (maybeStored.isLeft()) return maybeStored;

    return const Right(null);
  }
}

@singleton
class SendYoutubeTask extends NoteUseCasePrototype {
  const SendYoutubeTask(super.noteRepository);

  Future<Either<Failure, dynamic>> call(String youtubeUrl, NoteLanguage language) async {
    final maybeTaskId = await noteRepository.sendYoutubeTask(youtubeUrl, language);
    if (maybeTaskId.isLeft()) return maybeTaskId;

    // final maybeStored = await noteRepository.storeExpectedTask(maybeTaskId.asRight());
    // if (maybeStored.isLeft()) return maybeStored;

    return const Right(null);
  }
}

@singleton
class FetchExpectedNote extends NoteUseCasePrototype {
  const FetchExpectedNote(super.noteRepository);

  Future<Either<Failure, dynamic>> call(String taskId) async {
    final maybeNote = await noteRepository.getTaskResult(taskId);
    if (maybeNote.isLeft()) return maybeNote;

    // final maybeNoteId = await noteRepository.storeNote(maybeNote.asRight());
    // if (maybeNoteId.isLeft()) return maybeNoteId;

    // final maybeTaskIdsToDelete = await noteRepository.findExpectedTask(taskId);
    // if (maybeTaskIdsToDelete.isLeft()) return maybeTaskIdsToDelete;

    // final results = await Future.wait(
    //   maybeTaskIdsToDelete.asRight().map(noteRepository.deleteExpectedTask).toList(),
    // );

    // final failures = results.where((e) => e.isLeft()).toList();
    // if (failures.isNotEmpty) return failures[0];
    // MyWebLogger('FetchExpectedNote_UseCase').warning('${failures.length} taskIds are not deleted');

    return const Right(null);
  }
}
