class LoginForm {
  const LoginForm({
    required this.userName,
    required this.userPassword,
    required this.submitText,
  });

  factory LoginForm.empty() => const LoginForm(
        userName: '',
        userPassword: '',
        submitText: 'Sign In',
      );

  final String userName;
  final String userPassword;
  final String submitText;

  LoginForm copyWith({
    String? userName,
    String? userPassword,
    String? submitText,
  }) {
    return LoginForm(
      userName: userName ?? this.userName,
      userPassword: userPassword ?? this.userPassword,
      submitText: submitText ?? this.submitText,
    );
  }
}
