import 'package:dartz/dartz.dart' hide State;
import 'package:algoload_flutter_web_app/src/core/error/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/domain/_barrel.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, String>> loginUser(LoginForm form);

  Future<Either<Failure, void>> logoutUser();

  Future<Either<Failure, void>> storeSessionToken(String sessionToken);

  Future<Either<Failure, void>> deleteSessionToken();
}
