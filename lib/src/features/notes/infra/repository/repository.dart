import 'package:dartz/dartz.dart' hide State;
import 'package:injectable/injectable.dart';
import 'package:notes_app_with_ai/src/core/error/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/_barrel.dart';

@Singleton(as: INoteRepository)
class NoteRepositoryImpl implements INoteRepository {
  const NoteRepositoryImpl(
    this.remoteDataSource,
  );

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
