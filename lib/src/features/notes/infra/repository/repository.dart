import 'package:dartz/dartz.dart' hide State;
import 'package:injectable/injectable.dart';
import 'package:notes_app_with_ai/src/core/error/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/_barrel.dart';

@Singleton(as: INoteRepository)
class NoteRepositoryImpl implements INoteRepository {
  const NoteRepositoryImpl(
    this.localDataSource,
    this.remoteDataSource,
  );

  final INoteLocalDataSource localDataSource;
  final INoteRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> sendAudioFileTask(String audioFilePath, NoteLanguage language) async {
    return _safetyRequest<String>(() async {
      final taskId = remoteDataSource.sendAudioFileTask(audioFilePath, language);
      return taskId;
    });
  }

  @override
  Future<Either<Failure, String>> sendYoutubeTask(String youtubeUrl, NoteLanguage language) async {
    return _safetyRequest<String>(() async {
      final taskId = remoteDataSource.sendYoutubeTask(youtubeUrl, language);
      return taskId;
    });
  }

  @override
  Future<Either<Failure, Note>> getTaskResult(String taskId) async {
    return _safetyRequest<Note>(() async {
      final noteDto = await remoteDataSource.getTaskResult(taskId);
      return noteDto.toEntity();
    });
  }

  @override
  Future<Either<Failure, int>> storeNote(Note note) async {
    return _safetyRequest<int>(() async {
      final storageId = await localDataSource.storeNote(note);
      return storageId;
    });
  }

  @override
  Future<Either<Failure, Note>> readNote(int id) async {
    return _safetyRequest<Note>(() async {
      final noteCollection = await localDataSource.readNote(id);
      return noteCollection.toEntity();
    });
  }

  @override
  Future<Either<Failure, List<Note>>> readAllNotes() async {
    return _safetyRequest<List<Note>>(() async {
      final noteCollections = await localDataSource.readAllNotes();
      return noteCollections.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, bool>> deleteNote(int id) async {
    return _safetyRequest<bool>(() async {
      final isDeleted = localDataSource.deleteNote(id);
      return isDeleted;
    });
  }

  @override
  Future<Either<Failure, int>> storeExpectedTask(String taskId) async {
    return _safetyRequest<int>(() async {
      final storageId = await localDataSource.storeExpectedTaskId(taskId);
      return storageId;
    });
  }

  @override
  Future<Either<Failure, List<String>>> readAllExpectedTaskIds() async {
    return _safetyRequest<List<String>>(() async {
      final expectedTaskCollections = await localDataSource.readAllExpectedTasks();
      return expectedTaskCollections.map((e) => e.remoteTaskId).toList();
    });
  }

  @override
  Future<Either<Failure, List<int>>> findExpectedTask(String taskId) async {
    return _safetyRequest<List<int>>(() async {
      final expectedTaskCollections = await localDataSource.findExpectedTasks(taskId);
      return expectedTaskCollections.map((e) => e.id).toList();
    });
  }

  @override
  Future<Either<Failure, bool>> deleteExpectedTask(int id) async {
    return _safetyRequest<bool>(() async {
      final isDeleted = localDataSource.deleteExpectedTask(id);
      return isDeleted;
    });
  }

  // Helper
  Future<Either<Failure, T>> _safetyRequest<T>(Future<T> Function() request) async {
    try {
      return Right(await request());
    } on ServerException catch (e) {
      return Left(ServerFailure(description: e.description));
    } on CacheException catch (e) {
      return Left(CacheFailure(description: e.description));
    } on Exception catch (e, t) {
      return Left(UnknownFailure(description: 'UnknownException: $e;\ntrace = $t'));
    }
  }
}
