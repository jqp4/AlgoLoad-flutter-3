import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/domain/_barrel.dart';
import 'package:algoload_flutter_web_app/src/foundation/_barrel.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:injectable/injectable.dart';

abstract class AuthUseCasePrototype {
  const AuthUseCasePrototype(this.authRepository);

  final IAuthRepository authRepository;
}

@singleton
class LoginUser extends AuthUseCasePrototype {
  const LoginUser(super.authRepository);

  Future<Either<Failure, void>> call(LoginForm form) async {
    final maybeSessionToken = await authRepository.loginUser(form);
    if (maybeSessionToken.isLeft()) return maybeSessionToken;

    final maybeStored = await authRepository.storeSessionToken(maybeSessionToken.asRight());
    if (maybeStored.isLeft()) return maybeStored;

    return const Right(null);
  }
}

@singleton
class LogoutUser extends AuthUseCasePrototype {
  const LogoutUser(super.authRepository);

  Future<Either<Failure, void>> call() async {
    final maybeLogouted = await authRepository.logoutUser();
    if (maybeLogouted.isLeft()) return maybeLogouted;

    final maybeDeleted = await authRepository.deleteSessionToken();
    if (maybeDeleted.isLeft()) return maybeDeleted;

    return const Right(null);
  }
}
