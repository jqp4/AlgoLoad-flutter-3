import 'package:algoload_flutter_web_app/src/features/auth/domain/_barrel.dart';

abstract interface class IAuthRemoteDataSource {
  Future<String> loginUser(LoginForm form);

  Future<void> logoutUser();

  @Deprecated('In the current version, authorization no longer explicitly uses the session token.')
  Future<void> storeSessionToken(String sessionToken);

  @Deprecated('In the current version, authorization no longer explicitly uses the session token.')
  Future<void> deleteSessionToken();
}
