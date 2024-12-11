part of 'bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.updateUserNameForm(String value) = _UpdateUserNameForm;

  const factory AuthEvent.updatePasswordForm(String value) = _UpdatePasswordForm;

  const factory AuthEvent.submitLoginForm() = _SubmitLoginForm;

  const factory AuthEvent.logout() = _Logout;
}
