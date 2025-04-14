import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/presentation/_barrel.dart';
import 'package:algoload_flutter_web_app/src/foundation/extensoins/context.dart';
import 'package:algoload_flutter_web_app/src/foundation/utils/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// todo: remove
// const username = 'kkk000';
// const password = 'zZ05w9IXqGbe';

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({
    this.maybeFailureDescription,
    super.key,
  });

  final String? maybeFailureDescription;

  @override
  State<LoginFormPage> createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
  final TextEditingController _userNameFormController = TextEditingController();
  final TextEditingController _passwordFormController = TextEditingController();

  late ThemeData _theme;
  late AuthBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = context.theme;
    _bloc = context.watch<AuthBloc>();
  }

  @override
  void dispose() {
    _userNameFormController.dispose();
    _passwordFormController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _theme.colorScheme.surface;

    // todo: remove
    pprint('kkk000 zZ05w9IXqGbe');

    return Material(
      color: backgroundColor,
      // todo: сделать что то с InkWell, потому что в вебе он везде предлагает тыкнуть
      child: InkWell(
        onTap: () {
          // Убираем фокус с полей ввода
          context.unfocus();
        },
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 340),
                child: AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sign in',
                        style: _theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const Gap.y(32.0),
                      MyTextField(
                        label: 'Username',
                        autofillHints: const [AutofillHints.username],
                        controller: _userNameFormController,
                        onChanged: (value) {
                          _bloc.add(AuthEvent.updateUserNameForm(value));
                        },
                      ),

                      const Gap.y(16.0),
                      MyTextFieldObscured(
                        label: 'Password',
                        autofillHints: const [AutofillHints.password],
                        controller: _passwordFormController,
                        onChanged: (value) {
                          _bloc.add(AuthEvent.updatePasswordForm(value));
                        },
                      ),

                      const Gap.y(32),
                      MyButton(
                        title: 'Sign in',
                        isExpanded: true,
                        onPressed: () {
                          _bloc.add(const AuthEvent.submitLoginForm());
                        },
                      ),

                      // Сообщение об ошибке, если есть
                      if (widget.maybeFailureDescription != null) ...[
                        const Gap.y(36),
                        Text(
                          widget.maybeFailureDescription!,
                          style: _theme.textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: _theme.colorScheme.error,
                          ),
                        ),
                      ],

                      const Gap.y(36),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
