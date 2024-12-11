// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateUserNameForm,
    required TResult Function(String value) updatePasswordForm,
    required TResult Function() submitLoginForm,
    required TResult Function() tryAutoLogin,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateUserNameForm,
    TResult? Function(String value)? updatePasswordForm,
    TResult? Function()? submitLoginForm,
    TResult? Function()? tryAutoLogin,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateUserNameForm,
    TResult Function(String value)? updatePasswordForm,
    TResult Function()? submitLoginForm,
    TResult Function()? tryAutoLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserNameForm value) updateUserNameForm,
    required TResult Function(_UpdatePasswordForm value) updatePasswordForm,
    required TResult Function(_SubmitLoginForm value) submitLoginForm,
    required TResult Function(_TryAutoLogin value) tryAutoLogin,
    required TResult Function(_Logout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult? Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult? Function(_SubmitLoginForm value)? submitLoginForm,
    TResult? Function(_TryAutoLogin value)? tryAutoLogin,
    TResult? Function(_Logout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult Function(_SubmitLoginForm value)? submitLoginForm,
    TResult Function(_TryAutoLogin value)? tryAutoLogin,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UpdateUserNameFormImplCopyWith<$Res> {
  factory _$$UpdateUserNameFormImplCopyWith(_$UpdateUserNameFormImpl value,
          $Res Function(_$UpdateUserNameFormImpl) then) =
      __$$UpdateUserNameFormImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UpdateUserNameFormImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UpdateUserNameFormImpl>
    implements _$$UpdateUserNameFormImplCopyWith<$Res> {
  __$$UpdateUserNameFormImplCopyWithImpl(_$UpdateUserNameFormImpl _value,
      $Res Function(_$UpdateUserNameFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UpdateUserNameFormImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateUserNameFormImpl implements _UpdateUserNameForm {
  const _$UpdateUserNameFormImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'AuthEvent.updateUserNameForm(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserNameFormImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserNameFormImplCopyWith<_$UpdateUserNameFormImpl> get copyWith =>
      __$$UpdateUserNameFormImplCopyWithImpl<_$UpdateUserNameFormImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateUserNameForm,
    required TResult Function(String value) updatePasswordForm,
    required TResult Function() submitLoginForm,
    required TResult Function() tryAutoLogin,
    required TResult Function() logout,
  }) {
    return updateUserNameForm(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateUserNameForm,
    TResult? Function(String value)? updatePasswordForm,
    TResult? Function()? submitLoginForm,
    TResult? Function()? tryAutoLogin,
    TResult? Function()? logout,
  }) {
    return updateUserNameForm?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateUserNameForm,
    TResult Function(String value)? updatePasswordForm,
    TResult Function()? submitLoginForm,
    TResult Function()? tryAutoLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (updateUserNameForm != null) {
      return updateUserNameForm(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserNameForm value) updateUserNameForm,
    required TResult Function(_UpdatePasswordForm value) updatePasswordForm,
    required TResult Function(_SubmitLoginForm value) submitLoginForm,
    required TResult Function(_TryAutoLogin value) tryAutoLogin,
    required TResult Function(_Logout value) logout,
  }) {
    return updateUserNameForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult? Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult? Function(_SubmitLoginForm value)? submitLoginForm,
    TResult? Function(_TryAutoLogin value)? tryAutoLogin,
    TResult? Function(_Logout value)? logout,
  }) {
    return updateUserNameForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult Function(_SubmitLoginForm value)? submitLoginForm,
    TResult Function(_TryAutoLogin value)? tryAutoLogin,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (updateUserNameForm != null) {
      return updateUserNameForm(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserNameForm implements AuthEvent {
  const factory _UpdateUserNameForm(final String value) =
      _$UpdateUserNameFormImpl;

  String get value;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserNameFormImplCopyWith<_$UpdateUserNameFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePasswordFormImplCopyWith<$Res> {
  factory _$$UpdatePasswordFormImplCopyWith(_$UpdatePasswordFormImpl value,
          $Res Function(_$UpdatePasswordFormImpl) then) =
      __$$UpdatePasswordFormImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UpdatePasswordFormImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UpdatePasswordFormImpl>
    implements _$$UpdatePasswordFormImplCopyWith<$Res> {
  __$$UpdatePasswordFormImplCopyWithImpl(_$UpdatePasswordFormImpl _value,
      $Res Function(_$UpdatePasswordFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UpdatePasswordFormImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePasswordFormImpl implements _UpdatePasswordForm {
  const _$UpdatePasswordFormImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'AuthEvent.updatePasswordForm(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordFormImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordFormImplCopyWith<_$UpdatePasswordFormImpl> get copyWith =>
      __$$UpdatePasswordFormImplCopyWithImpl<_$UpdatePasswordFormImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateUserNameForm,
    required TResult Function(String value) updatePasswordForm,
    required TResult Function() submitLoginForm,
    required TResult Function() tryAutoLogin,
    required TResult Function() logout,
  }) {
    return updatePasswordForm(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateUserNameForm,
    TResult? Function(String value)? updatePasswordForm,
    TResult? Function()? submitLoginForm,
    TResult? Function()? tryAutoLogin,
    TResult? Function()? logout,
  }) {
    return updatePasswordForm?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateUserNameForm,
    TResult Function(String value)? updatePasswordForm,
    TResult Function()? submitLoginForm,
    TResult Function()? tryAutoLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (updatePasswordForm != null) {
      return updatePasswordForm(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserNameForm value) updateUserNameForm,
    required TResult Function(_UpdatePasswordForm value) updatePasswordForm,
    required TResult Function(_SubmitLoginForm value) submitLoginForm,
    required TResult Function(_TryAutoLogin value) tryAutoLogin,
    required TResult Function(_Logout value) logout,
  }) {
    return updatePasswordForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult? Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult? Function(_SubmitLoginForm value)? submitLoginForm,
    TResult? Function(_TryAutoLogin value)? tryAutoLogin,
    TResult? Function(_Logout value)? logout,
  }) {
    return updatePasswordForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult Function(_SubmitLoginForm value)? submitLoginForm,
    TResult Function(_TryAutoLogin value)? tryAutoLogin,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (updatePasswordForm != null) {
      return updatePasswordForm(this);
    }
    return orElse();
  }
}

abstract class _UpdatePasswordForm implements AuthEvent {
  const factory _UpdatePasswordForm(final String value) =
      _$UpdatePasswordFormImpl;

  String get value;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordFormImplCopyWith<_$UpdatePasswordFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitLoginFormImplCopyWith<$Res> {
  factory _$$SubmitLoginFormImplCopyWith(_$SubmitLoginFormImpl value,
          $Res Function(_$SubmitLoginFormImpl) then) =
      __$$SubmitLoginFormImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitLoginFormImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SubmitLoginFormImpl>
    implements _$$SubmitLoginFormImplCopyWith<$Res> {
  __$$SubmitLoginFormImplCopyWithImpl(
      _$SubmitLoginFormImpl _value, $Res Function(_$SubmitLoginFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmitLoginFormImpl implements _SubmitLoginForm {
  const _$SubmitLoginFormImpl();

  @override
  String toString() {
    return 'AuthEvent.submitLoginForm()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitLoginFormImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateUserNameForm,
    required TResult Function(String value) updatePasswordForm,
    required TResult Function() submitLoginForm,
    required TResult Function() tryAutoLogin,
    required TResult Function() logout,
  }) {
    return submitLoginForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateUserNameForm,
    TResult? Function(String value)? updatePasswordForm,
    TResult? Function()? submitLoginForm,
    TResult? Function()? tryAutoLogin,
    TResult? Function()? logout,
  }) {
    return submitLoginForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateUserNameForm,
    TResult Function(String value)? updatePasswordForm,
    TResult Function()? submitLoginForm,
    TResult Function()? tryAutoLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (submitLoginForm != null) {
      return submitLoginForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserNameForm value) updateUserNameForm,
    required TResult Function(_UpdatePasswordForm value) updatePasswordForm,
    required TResult Function(_SubmitLoginForm value) submitLoginForm,
    required TResult Function(_TryAutoLogin value) tryAutoLogin,
    required TResult Function(_Logout value) logout,
  }) {
    return submitLoginForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult? Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult? Function(_SubmitLoginForm value)? submitLoginForm,
    TResult? Function(_TryAutoLogin value)? tryAutoLogin,
    TResult? Function(_Logout value)? logout,
  }) {
    return submitLoginForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult Function(_SubmitLoginForm value)? submitLoginForm,
    TResult Function(_TryAutoLogin value)? tryAutoLogin,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (submitLoginForm != null) {
      return submitLoginForm(this);
    }
    return orElse();
  }
}

abstract class _SubmitLoginForm implements AuthEvent {
  const factory _SubmitLoginForm() = _$SubmitLoginFormImpl;
}

/// @nodoc
abstract class _$$TryAutoLoginImplCopyWith<$Res> {
  factory _$$TryAutoLoginImplCopyWith(
          _$TryAutoLoginImpl value, $Res Function(_$TryAutoLoginImpl) then) =
      __$$TryAutoLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TryAutoLoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$TryAutoLoginImpl>
    implements _$$TryAutoLoginImplCopyWith<$Res> {
  __$$TryAutoLoginImplCopyWithImpl(
      _$TryAutoLoginImpl _value, $Res Function(_$TryAutoLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TryAutoLoginImpl implements _TryAutoLogin {
  const _$TryAutoLoginImpl();

  @override
  String toString() {
    return 'AuthEvent.tryAutoLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TryAutoLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateUserNameForm,
    required TResult Function(String value) updatePasswordForm,
    required TResult Function() submitLoginForm,
    required TResult Function() tryAutoLogin,
    required TResult Function() logout,
  }) {
    return tryAutoLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateUserNameForm,
    TResult? Function(String value)? updatePasswordForm,
    TResult? Function()? submitLoginForm,
    TResult? Function()? tryAutoLogin,
    TResult? Function()? logout,
  }) {
    return tryAutoLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateUserNameForm,
    TResult Function(String value)? updatePasswordForm,
    TResult Function()? submitLoginForm,
    TResult Function()? tryAutoLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (tryAutoLogin != null) {
      return tryAutoLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserNameForm value) updateUserNameForm,
    required TResult Function(_UpdatePasswordForm value) updatePasswordForm,
    required TResult Function(_SubmitLoginForm value) submitLoginForm,
    required TResult Function(_TryAutoLogin value) tryAutoLogin,
    required TResult Function(_Logout value) logout,
  }) {
    return tryAutoLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult? Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult? Function(_SubmitLoginForm value)? submitLoginForm,
    TResult? Function(_TryAutoLogin value)? tryAutoLogin,
    TResult? Function(_Logout value)? logout,
  }) {
    return tryAutoLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult Function(_SubmitLoginForm value)? submitLoginForm,
    TResult Function(_TryAutoLogin value)? tryAutoLogin,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (tryAutoLogin != null) {
      return tryAutoLogin(this);
    }
    return orElse();
  }
}

abstract class _TryAutoLogin implements AuthEvent {
  const factory _TryAutoLogin() = _$TryAutoLoginImpl;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateUserNameForm,
    required TResult Function(String value) updatePasswordForm,
    required TResult Function() submitLoginForm,
    required TResult Function() tryAutoLogin,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateUserNameForm,
    TResult? Function(String value)? updatePasswordForm,
    TResult? Function()? submitLoginForm,
    TResult? Function()? tryAutoLogin,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateUserNameForm,
    TResult Function(String value)? updatePasswordForm,
    TResult Function()? submitLoginForm,
    TResult Function()? tryAutoLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateUserNameForm value) updateUserNameForm,
    required TResult Function(_UpdatePasswordForm value) updatePasswordForm,
    required TResult Function(_SubmitLoginForm value) submitLoginForm,
    required TResult Function(_TryAutoLogin value) tryAutoLogin,
    required TResult Function(_Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult? Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult? Function(_SubmitLoginForm value)? submitLoginForm,
    TResult? Function(_TryAutoLogin value)? tryAutoLogin,
    TResult? Function(_Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateUserNameForm value)? updateUserNameForm,
    TResult Function(_UpdatePasswordForm value)? updatePasswordForm,
    TResult Function(_SubmitLoginForm value)? submitLoginForm,
    TResult Function(_TryAutoLogin value)? tryAutoLogin,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function() loaded,
    required TResult Function(String failureDescription) failure,
    required TResult Function() completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function()? loaded,
    TResult? Function(String failureDescription)? failure,
    TResult? Function()? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function()? loaded,
    TResult Function(String failureDescription)? failure,
    TResult Function()? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Completed value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Completed value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Pending value)? pending,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function() loaded,
    required TResult Function(String failureDescription) failure,
    required TResult Function() completed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function()? loaded,
    TResult? Function(String failureDescription)? failure,
    TResult? Function()? completed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function()? loaded,
    TResult Function(String failureDescription)? failure,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Completed value) completed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Completed value)? completed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Pending value)? pending,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$PendingImplCopyWith<$Res> {
  factory _$$PendingImplCopyWith(
          _$PendingImpl value, $Res Function(_$PendingImpl) then) =
      __$$PendingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PendingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PendingImpl>
    implements _$$PendingImplCopyWith<$Res> {
  __$$PendingImplCopyWithImpl(
      _$PendingImpl _value, $Res Function(_$PendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PendingImpl implements _Pending {
  const _$PendingImpl();

  @override
  String toString() {
    return 'AuthState.pending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PendingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function() loaded,
    required TResult Function(String failureDescription) failure,
    required TResult Function() completed,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function()? loaded,
    TResult? Function(String failureDescription)? failure,
    TResult? Function()? completed,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function()? loaded,
    TResult Function(String failureDescription)? failure,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Completed value) completed,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Completed value)? completed,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Pending value)? pending,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _Pending implements AuthState {
  const factory _Pending() = _$PendingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl();

  @override
  String toString() {
    return 'AuthState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function() loaded,
    required TResult Function(String failureDescription) failure,
    required TResult Function() completed,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function()? loaded,
    TResult? Function(String failureDescription)? failure,
    TResult? Function()? completed,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function()? loaded,
    TResult Function(String failureDescription)? failure,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Completed value) completed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Completed value)? completed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Pending value)? pending,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AuthState {
  const factory _Loaded() = _$LoadedImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String failureDescription});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureDescription = null,
  }) {
    return _then(_$FailureImpl(
      null == failureDescription
          ? _value.failureDescription
          : failureDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.failureDescription);

  @override
  final String failureDescription;

  @override
  String toString() {
    return 'AuthState.failure(failureDescription: $failureDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.failureDescription, failureDescription) ||
                other.failureDescription == failureDescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureDescription);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function() loaded,
    required TResult Function(String failureDescription) failure,
    required TResult Function() completed,
  }) {
    return failure(failureDescription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function()? loaded,
    TResult? Function(String failureDescription)? failure,
    TResult? Function()? completed,
  }) {
    return failure?.call(failureDescription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function()? loaded,
    TResult Function(String failureDescription)? failure,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(failureDescription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Completed value) completed,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Completed value)? completed,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Pending value)? pending,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements AuthState {
  const factory _Failure(final String failureDescription) = _$FailureImpl;

  String get failureDescription;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompletedImplCopyWith<$Res> {
  factory _$$CompletedImplCopyWith(
          _$CompletedImpl value, $Res Function(_$CompletedImpl) then) =
      __$$CompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompletedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$CompletedImpl>
    implements _$$CompletedImplCopyWith<$Res> {
  __$$CompletedImplCopyWithImpl(
      _$CompletedImpl _value, $Res Function(_$CompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CompletedImpl implements _Completed {
  const _$CompletedImpl();

  @override
  String toString() {
    return 'AuthState.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() pending,
    required TResult Function() loaded,
    required TResult Function(String failureDescription) failure,
    required TResult Function() completed,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? pending,
    TResult? Function()? loaded,
    TResult? Function(String failureDescription)? failure,
    TResult? Function()? completed,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? pending,
    TResult Function()? loaded,
    TResult Function(String failureDescription)? failure,
    TResult Function()? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Completed value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Completed value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Pending value)? pending,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed implements AuthState {
  const factory _Completed() = _$CompletedImpl;
}
