import 'package:algoload_flutter_web_app/src/core/error/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/domain/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/infra/_barrel.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:injectable/injectable.dart';

@Singleton(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  const AuthRepositoryImpl(
    this.remoteDataSource,
  );

  final IAuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> loginUser(LoginForm form) async {
    return _safetyRequest<String>(() async {
      final sessionToken = await remoteDataSource.loginUser(form);
      return sessionToken;
    });
  }

  @override
  Future<Either<Failure, void>> logoutUser() async {
    return _safetyRequest<void>(() async {
      return remoteDataSource.logoutUser();
    });
  }

  @override
  Future<Either<Failure, void>> storeSessionToken(String sessionToken) async {
    return _safetyRequest<void>(() async {
      return remoteDataSource.storeSessionToken(sessionToken);
    });
  }

  @override
  Future<Either<Failure, void>> deleteSessionToken() async {
    return _safetyRequest<void>(() async {
      return remoteDataSource.deleteSessionToken();
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
