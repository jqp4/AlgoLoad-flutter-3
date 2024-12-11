import 'package:notes_app_with_ai/src/features/auth/domain/_barrel.dart';

abstract interface class IAuthRemoteDataSource {
  Future<String> loginUser(LoginForm form);

  Future<void> logoutUser();

  Future<void> storeSessionToken(String sessionToken);

  Future<void> deleteSessionToken();
}
