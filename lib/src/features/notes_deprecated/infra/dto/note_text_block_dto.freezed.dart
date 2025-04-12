// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_text_block_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoteTextBlockDto _$NoteTextBlockDtoFromJson(Map<String, dynamic> json) {
  return _NoteTextBlockDto.fromJson(json);
}

/// @nodoc
mixin _$NoteTextBlockDto {
  @JsonKey(name: 'title')
  String get subtitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  String get timing => throw _privateConstructorUsedError;
  @JsonKey(name: 'texts')
  List<String> get texts => throw _privateConstructorUsedError;

  /// Serializes this NoteTextBlockDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoteTextBlockDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteTextBlockDtoCopyWith<NoteTextBlockDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteTextBlockDtoCopyWith<$Res> {
  factory $NoteTextBlockDtoCopyWith(
          NoteTextBlockDto value, $Res Function(NoteTextBlockDto) then) =
      _$NoteTextBlockDtoCopyWithImpl<$Res, NoteTextBlockDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String subtitle,
      @JsonKey(name: 'time') String timing,
      @JsonKey(name: 'texts') List<String> texts});
}

/// @nodoc
class _$NoteTextBlockDtoCopyWithImpl<$Res, $Val extends NoteTextBlockDto>
    implements $NoteTextBlockDtoCopyWith<$Res> {
  _$NoteTextBlockDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoteTextBlockDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtitle = null,
    Object? timing = null,
    Object? texts = null,
  }) {
    return _then(_value.copyWith(
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as String,
      texts: null == texts
          ? _value.texts
          : texts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteTextBlockDtoImplCopyWith<$Res>
    implements $NoteTextBlockDtoCopyWith<$Res> {
  factory _$$NoteTextBlockDtoImplCopyWith(_$NoteTextBlockDtoImpl value,
          $Res Function(_$NoteTextBlockDtoImpl) then) =
      __$$NoteTextBlockDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String subtitle,
      @JsonKey(name: 'time') String timing,
      @JsonKey(name: 'texts') List<String> texts});
}

/// @nodoc
class __$$NoteTextBlockDtoImplCopyWithImpl<$Res>
    extends _$NoteTextBlockDtoCopyWithImpl<$Res, _$NoteTextBlockDtoImpl>
    implements _$$NoteTextBlockDtoImplCopyWith<$Res> {
  __$$NoteTextBlockDtoImplCopyWithImpl(_$NoteTextBlockDtoImpl _value,
      $Res Function(_$NoteTextBlockDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoteTextBlockDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtitle = null,
    Object? timing = null,
    Object? texts = null,
  }) {
    return _then(_$NoteTextBlockDtoImpl(
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
      timing: null == timing
          ? _value.timing
          : timing // ignore: cast_nullable_to_non_nullable
              as String,
      texts: null == texts
          ? _value._texts
          : texts // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteTextBlockDtoImpl implements _NoteTextBlockDto {
  const _$NoteTextBlockDtoImpl(
      {@JsonKey(name: 'title') required this.subtitle,
      @JsonKey(name: 'time') required this.timing,
      @JsonKey(name: 'texts') required final List<String> texts})
      : _texts = texts;

  factory _$NoteTextBlockDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteTextBlockDtoImplFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String subtitle;
  @override
  @JsonKey(name: 'time')
  final String timing;
  final List<String> _texts;
  @override
  @JsonKey(name: 'texts')
  List<String> get texts {
    if (_texts is EqualUnmodifiableListView) return _texts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_texts);
  }

  @override
  String toString() {
    return 'NoteTextBlockDto(subtitle: $subtitle, timing: $timing, texts: $texts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteTextBlockDtoImpl &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle) &&
            (identical(other.timing, timing) || other.timing == timing) &&
            const DeepCollectionEquality().equals(other._texts, _texts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subtitle, timing,
      const DeepCollectionEquality().hash(_texts));

  /// Create a copy of NoteTextBlockDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteTextBlockDtoImplCopyWith<_$NoteTextBlockDtoImpl> get copyWith =>
      __$$NoteTextBlockDtoImplCopyWithImpl<_$NoteTextBlockDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteTextBlockDtoImplToJson(
      this,
    );
  }
}

abstract class _NoteTextBlockDto implements NoteTextBlockDto {
  const factory _NoteTextBlockDto(
          {@JsonKey(name: 'title') required final String subtitle,
          @JsonKey(name: 'time') required final String timing,
          @JsonKey(name: 'texts') required final List<String> texts}) =
      _$NoteTextBlockDtoImpl;

  factory _NoteTextBlockDto.fromJson(Map<String, dynamic> json) =
      _$NoteTextBlockDtoImpl.fromJson;

  @override
  @JsonKey(name: 'title')
  String get subtitle;
  @override
  @JsonKey(name: 'time')
  String get timing;
  @override
  @JsonKey(name: 'texts')
  List<String> get texts;

  /// Create a copy of NoteTextBlockDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteTextBlockDtoImplCopyWith<_$NoteTextBlockDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
