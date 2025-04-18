import 'package:algoload_flutter_web_app/src/core/error/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/domain/_barrel.dart';
import 'package:dartz/dartz.dart' hide State;

abstract interface class IAuthRepository {
  Future<Either<Failure, String>> loginUser(LoginForm form);

  Future<Either<Failure, void>> logoutUser();

  @Deprecated('In the current version, authorization no longer explicitly uses the session token.')
  Future<Either<Failure, void>> storeSessionToken(String sessionToken);

  @Deprecated('In the current version, authorization no longer explicitly uses the session token.')
  Future<Either<Failure, void>> deleteSessionToken();

  Future<Either<Failure, String>> getUserName();
}
