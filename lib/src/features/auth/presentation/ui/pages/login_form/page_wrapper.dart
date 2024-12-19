import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/presentation/_barrel.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingOverlay = inject<LoadingOverlay>();

    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc()..add(const AuthEvent.tryAutoLogin()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          loadingOverlay.hide();

          state.whenOrNull(
            pending: () {
              // show loading indicator
              loadingOverlay.show(context);
            },
            completed: () {
              context.router
                ..popUntilRoot()
                ..replace(const CreateNoteWithAudioRecordRoute());
            },
          );
        },
        builder: (context, state) {
          String? maybeFailureDescription;

          state.whenOrNull(
            failure: (failureDescription) {
              maybeFailureDescription = failureDescription;
            },
          );

          return LoginFormPage(
            maybeFailureDescription: maybeFailureDescription,
          );
        },
      ),
    );
  }
}
