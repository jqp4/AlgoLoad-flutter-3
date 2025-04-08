import 'dart:async';

import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/domain/_barrel.dart';
import 'package:algoload_flutter_web_app/src/foundation/_barrel.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc.freezed.dart';
part 'event.part.dart';
part 'state.part.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<_UpdateUserNameForm>(_updateUserNameForm);
    on<_UpdatePasswordForm>(_updatePasswordForm);
    on<_SubmitLoginForm>(_submitLoginForm);
    on<_TryAutoLogin>(_tryAutoLogin);
    on<_Logout>(_logout);
  }

  static final _log = MyWebLogger('AuthBloc');

  var _form = LoginForm.empty();
  LoginForm get form => _form;

  Future _updateUserNameForm(
    _UpdateUserNameForm event,
    Emitter<AuthState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _updateUserNameForm event');

    _form = _form.copyWith(userName: event.value);
    emit(const _Loaded());
  }

  Future _updatePasswordForm(
    _UpdatePasswordForm event,
    Emitter<AuthState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _updateUserNameForm event');

    _form = _form.copyWith(userPassword: event.value);
    emit(const _Loaded());
  }

  Future _submitLoginForm(
    _SubmitLoginForm event,
    Emitter<AuthState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _SubmitLoginForm event');

    final result = await inject<LoginUser>()(_form);

    if (result.isLeft()) {
      emit(_Failure(result.asLeft().description));
      return;
    }

    emit(const _Completed());
  }

  Future _tryAutoLogin(
    _TryAutoLogin event,
    Emitter<AuthState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _TryAutoLogin event');

    final result = await inject<LoginUser>()(_form);

    if (result.isLeft()) {
      emit(const _Loaded());
      return;
    }

    emit(const _Completed());
  }

  Future _logout(
    _Logout event,
    Emitter<AuthState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _Logout event');

    final result = await inject<LogoutUser>()();

    if (result.isLeft()) {
      emit(_Failure(result.asLeft().description));
      return;
    }

    _form = LoginForm.empty();
    emit(const _Loaded());
  }
}
