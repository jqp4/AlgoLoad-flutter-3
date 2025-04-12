import 'package:algoload_flutter_web_app/src/core/error/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/algoview/domain/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/algoview/infra/_barrel.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:injectable/injectable.dart';

// todo
@Singleton(as: IAlgoViewRepository)
class AlgoViewRepositoryImpl implements IAlgoViewRepository {
  const AlgoViewRepositoryImpl(
    this.remoteDataSource,
  );

  final IAlgoViewRemoteDataSource remoteDataSource;

  // example:

  // Future<Either<Failure, void>> logoutUser() async {
  //   return _safetyRequest<void>(() async {
  //     return remoteDataSource.logoutUser();
  //   });
  // }

  @override
  Future<Either<Failure, String>> reciveTask(ReciveTaskForm form) {
    // TODO: implement reciveTask
    throw UnimplementedError();
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
