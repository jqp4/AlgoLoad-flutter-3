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
mixin _$CreateNoteWithAudioFileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateFilePathForm,
    required TResult Function(NoteLanguage value) updateLanguageForm,
    required TResult Function() submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateFilePathForm,
    TResult? Function(NoteLanguage value)? updateLanguageForm,
    TResult? Function()? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateFilePathForm,
    TResult Function(NoteLanguage value)? updateLanguageForm,
    TResult Function()? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateFilePathForm value) updateFilePathForm,
    required TResult Function(_UpdateLanguageForm value) updateLanguageForm,
    required TResult Function(_Submit value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateFilePathForm value)? updateFilePathForm,
    TResult? Function(_UpdateLanguageForm value)? updateLanguageForm,
    TResult? Function(_Submit value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateFilePathForm value)? updateFilePathForm,
    TResult Function(_UpdateLanguageForm value)? updateLanguageForm,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNoteWithAudioFileEventCopyWith<$Res> {
  factory $CreateNoteWithAudioFileEventCopyWith(
          CreateNoteWithAudioFileEvent value,
          $Res Function(CreateNoteWithAudioFileEvent) then) =
      _$CreateNoteWithAudioFileEventCopyWithImpl<$Res,
          CreateNoteWithAudioFileEvent>;
}

/// @nodoc
class _$CreateNoteWithAudioFileEventCopyWithImpl<$Res,
        $Val extends CreateNoteWithAudioFileEvent>
    implements $CreateNoteWithAudioFileEventCopyWith<$Res> {
  _$CreateNoteWithAudioFileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateNoteWithAudioFileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UpdateFilePathFormImplCopyWith<$Res> {
  factory _$$UpdateFilePathFormImplCopyWith(_$UpdateFilePathFormImpl value,
          $Res Function(_$UpdateFilePathFormImpl) then) =
      __$$UpdateFilePathFormImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UpdateFilePathFormImplCopyWithImpl<$Res>
    extends _$CreateNoteWithAudioFileEventCopyWithImpl<$Res,
        _$UpdateFilePathFormImpl>
    implements _$$UpdateFilePathFormImplCopyWith<$Res> {
  __$$UpdateFilePathFormImplCopyWithImpl(_$UpdateFilePathFormImpl _value,
      $Res Function(_$UpdateFilePathFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateNoteWithAudioFileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UpdateFilePathFormImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateFilePathFormImpl implements _UpdateFilePathForm {
  const _$UpdateFilePathFormImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'CreateNoteWithAudioFileEvent.updateFilePathForm(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFilePathFormImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of CreateNoteWithAudioFileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFilePathFormImplCopyWith<_$UpdateFilePathFormImpl> get copyWith =>
      __$$UpdateFilePathFormImplCopyWithImpl<_$UpdateFilePathFormImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateFilePathForm,
    required TResult Function(NoteLanguage value) updateLanguageForm,
    required TResult Function() submit,
  }) {
    return updateFilePathForm(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateFilePathForm,
    TResult? Function(NoteLanguage value)? updateLanguageForm,
    TResult? Function()? submit,
  }) {
    return updateFilePathForm?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateFilePathForm,
    TResult Function(NoteLanguage value)? updateLanguageForm,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (updateFilePathForm != null) {
      return updateFilePathForm(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateFilePathForm value) updateFilePathForm,
    required TResult Function(_UpdateLanguageForm value) updateLanguageForm,
    required TResult Function(_Submit value) submit,
  }) {
    return updateFilePathForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateFilePathForm value)? updateFilePathForm,
    TResult? Function(_UpdateLanguageForm value)? updateLanguageForm,
    TResult? Function(_Submit value)? submit,
  }) {
    return updateFilePathForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateFilePathForm value)? updateFilePathForm,
    TResult Function(_UpdateLanguageForm value)? updateLanguageForm,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (updateFilePathForm != null) {
      return updateFilePathForm(this);
    }
    return orElse();
  }
}

abstract class _UpdateFilePathForm implements CreateNoteWithAudioFileEvent {
  const factory _UpdateFilePathForm(final String value) =
      _$UpdateFilePathFormImpl;

  String get value;

  /// Create a copy of CreateNoteWithAudioFileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateFilePathFormImplCopyWith<_$UpdateFilePathFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateLanguageFormImplCopyWith<$Res> {
  factory _$$UpdateLanguageFormImplCopyWith(_$UpdateLanguageFormImpl value,
          $Res Function(_$UpdateLanguageFormImpl) then) =
      __$$UpdateLanguageFormImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NoteLanguage value});
}

/// @nodoc
class __$$UpdateLanguageFormImplCopyWithImpl<$Res>
    extends _$CreateNoteWithAudioFileEventCopyWithImpl<$Res,
        _$UpdateLanguageFormImpl>
    implements _$$UpdateLanguageFormImplCopyWith<$Res> {
  __$$UpdateLanguageFormImplCopyWithImpl(_$UpdateLanguageFormImpl _value,
      $Res Function(_$UpdateLanguageFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateNoteWithAudioFileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UpdateLanguageFormImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as NoteLanguage,
    ));
  }
}

/// @nodoc

class _$UpdateLanguageFormImpl implements _UpdateLanguageForm {
  const _$UpdateLanguageFormImpl(this.value);

  @override
  final NoteLanguage value;

  @override
  String toString() {
    return 'CreateNoteWithAudioFileEvent.updateLanguageForm(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLanguageFormImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of CreateNoteWithAudioFileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLanguageFormImplCopyWith<_$UpdateLanguageFormImpl> get copyWith =>
      __$$UpdateLanguageFormImplCopyWithImpl<_$UpdateLanguageFormImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateFilePathForm,
    required TResult Function(NoteLanguage value) updateLanguageForm,
    required TResult Function() submit,
  }) {
    return updateLanguageForm(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateFilePathForm,
    TResult? Function(NoteLanguage value)? updateLanguageForm,
    TResult? Function()? submit,
  }) {
    return updateLanguageForm?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateFilePathForm,
    TResult Function(NoteLanguage value)? updateLanguageForm,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (updateLanguageForm != null) {
      return updateLanguageForm(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateFilePathForm value) updateFilePathForm,
    required TResult Function(_UpdateLanguageForm value) updateLanguageForm,
    required TResult Function(_Submit value) submit,
  }) {
    return updateLanguageForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateFilePathForm value)? updateFilePathForm,
    TResult? Function(_UpdateLanguageForm value)? updateLanguageForm,
    TResult? Function(_Submit value)? submit,
  }) {
    return updateLanguageForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateFilePathForm value)? updateFilePathForm,
    TResult Function(_UpdateLanguageForm value)? updateLanguageForm,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (updateLanguageForm != null) {
      return updateLanguageForm(this);
    }
    return orElse();
  }
}

abstract class _UpdateLanguageForm implements CreateNoteWithAudioFileEvent {
  const factory _UpdateLanguageForm(final NoteLanguage value) =
      _$UpdateLanguageFormImpl;

  NoteLanguage get value;

  /// Create a copy of CreateNoteWithAudioFileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateLanguageFormImplCopyWith<_$UpdateLanguageFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$CreateNoteWithAudioFileEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateNoteWithAudioFileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl();

  @override
  String toString() {
    return 'CreateNoteWithAudioFileEvent.submit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) updateFilePathForm,
    required TResult Function(NoteLanguage value) updateLanguageForm,
    required TResult Function() submit,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? updateFilePathForm,
    TResult? Function(NoteLanguage value)? updateLanguageForm,
    TResult? Function()? submit,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? updateFilePathForm,
    TResult Function(NoteLanguage value)? updateLanguageForm,
    TResult Function()? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateFilePathForm value) updateFilePathForm,
    required TResult Function(_UpdateLanguageForm value) updateLanguageForm,
    required TResult Function(_Submit value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateFilePathForm value)? updateFilePathForm,
    TResult? Function(_UpdateLanguageForm value)? updateLanguageForm,
    TResult? Function(_Submit value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateFilePathForm value)? updateFilePathForm,
    TResult Function(_UpdateLanguageForm value)? updateLanguageForm,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements CreateNoteWithAudioFileEvent {
  const factory _Submit() = _$SubmitImpl;
}

/// @nodoc
mixin _$CreateNoteWithAudioFileState {
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
abstract class $CreateNoteWithAudioFileStateCopyWith<$Res> {
  factory $CreateNoteWithAudioFileStateCopyWith(
          CreateNoteWithAudioFileState value,
          $Res Function(CreateNoteWithAudioFileState) then) =
      _$CreateNoteWithAudioFileStateCopyWithImpl<$Res,
          CreateNoteWithAudioFileState>;
}

/// @nodoc
class _$CreateNoteWithAudioFileStateCopyWithImpl<$Res,
        $Val extends CreateNoteWithAudioFileState>
    implements $CreateNoteWithAudioFileStateCopyWith<$Res> {
  _$CreateNoteWithAudioFileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateNoteWithAudioFileState
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
    extends _$CreateNoteWithAudioFileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateNoteWithAudioFileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CreateNoteWithAudioFileState.initial()';
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

abstract class _Initial implements CreateNoteWithAudioFileState {
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
    extends _$CreateNoteWithAudioFileStateCopyWithImpl<$Res, _$PendingImpl>
    implements _$$PendingImplCopyWith<$Res> {
  __$$PendingImplCopyWithImpl(
      _$PendingImpl _value, $Res Function(_$PendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateNoteWithAudioFileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PendingImpl implements _Pending {
  const _$PendingImpl();

  @override
  String toString() {
    return 'CreateNoteWithAudioFileState.pending()';
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

abstract class _Pending implements CreateNoteWithAudioFileState {
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
    extends _$CreateNoteWithAudioFileStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateNoteWithAudioFileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl();

  @override
  String toString() {
    return 'CreateNoteWithAudioFileState.loaded()';
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

abstract class _Loaded implements CreateNoteWithAudioFileState {
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
    extends _$CreateNoteWithAudioFileStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateNoteWithAudioFileState
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
    return 'CreateNoteWithAudioFileState.failure(failureDescription: $failureDescription)';
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

  /// Create a copy of CreateNoteWithAudioFileState
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

abstract class _Failure implements CreateNoteWithAudioFileState {
  const factory _Failure(final String failureDescription) = _$FailureImpl;

  String get failureDescription;

  /// Create a copy of CreateNoteWithAudioFileState
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
    extends _$CreateNoteWithAudioFileStateCopyWithImpl<$Res, _$CompletedImpl>
    implements _$$CompletedImplCopyWith<$Res> {
  __$$CompletedImplCopyWithImpl(
      _$CompletedImpl _value, $Res Function(_$CompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateNoteWithAudioFileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CompletedImpl implements _Completed {
  const _$CompletedImpl();

  @override
  String toString() {
    return 'CreateNoteWithAudioFileState.completed()';
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

abstract class _Completed implements CreateNoteWithAudioFileState {
  const factory _Completed() = _$CompletedImpl;
}
