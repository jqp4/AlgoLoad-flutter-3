// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoteDto _$NoteDtoFromJson(Map<String, dynamic> json) {
  return _NoteDto.fromJson(json);
}

/// @nodoc
mixin _$NoteDto {
  @JsonKey(name: 'note_title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'emoji')
  String get emojiIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'language')
  @NoteLanguageSerializer()
  NoteLanguage get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  @TimestampSerializer()
  DateTime get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary')
  List<NoteTextBlockDto> get textBlocks => throw _privateConstructorUsedError;
  @JsonKey(name: 'note_source')
  @NoteSourceSerializer()
  NoteSource get noteSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'note_source_youtube_url')
  String get youtubeSourceLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_id')
  String get taskId => throw _privateConstructorUsedError;

  /// Serializes this NoteDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteDtoCopyWith<NoteDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDtoCopyWith<$Res> {
  factory $NoteDtoCopyWith(NoteDto value, $Res Function(NoteDto) then) =
      _$NoteDtoCopyWithImpl<$Res, NoteDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'note_title') String title,
      @JsonKey(name: 'emoji') String emojiIcon,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'language')
      @NoteLanguageSerializer()
      NoteLanguage language,
      @JsonKey(name: 'date') @TimestampSerializer() DateTime creationDate,
      @JsonKey(name: 'summary') List<NoteTextBlockDto> textBlocks,
      @JsonKey(name: 'note_source')
      @NoteSourceSerializer()
      NoteSource noteSource,
      @JsonKey(name: 'note_source_youtube_url') String youtubeSourceLink,
      @JsonKey(name: 'task_id') String taskId});
}

/// @nodoc
class _$NoteDtoCopyWithImpl<$Res, $Val extends NoteDto>
    implements $NoteDtoCopyWith<$Res> {
  _$NoteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? emojiIcon = null,
    Object? description = null,
    Object? language = null,
    Object? creationDate = null,
    Object? textBlocks = null,
    Object? noteSource = null,
    Object? youtubeSourceLink = null,
    Object? taskId = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      emojiIcon: null == emojiIcon
          ? _value.emojiIcon
          : emojiIcon // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as NoteLanguage,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      textBlocks: null == textBlocks
          ? _value.textBlocks
          : textBlocks // ignore: cast_nullable_to_non_nullable
              as List<NoteTextBlockDto>,
      noteSource: null == noteSource
          ? _value.noteSource
          : noteSource // ignore: cast_nullable_to_non_nullable
              as NoteSource,
      youtubeSourceLink: null == youtubeSourceLink
          ? _value.youtubeSourceLink
          : youtubeSourceLink // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteDtoImplCopyWith<$Res> implements $NoteDtoCopyWith<$Res> {
  factory _$$NoteDtoImplCopyWith(
          _$NoteDtoImpl value, $Res Function(_$NoteDtoImpl) then) =
      __$$NoteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'note_title') String title,
      @JsonKey(name: 'emoji') String emojiIcon,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'language')
      @NoteLanguageSerializer()
      NoteLanguage language,
      @JsonKey(name: 'date') @TimestampSerializer() DateTime creationDate,
      @JsonKey(name: 'summary') List<NoteTextBlockDto> textBlocks,
      @JsonKey(name: 'note_source')
      @NoteSourceSerializer()
      NoteSource noteSource,
      @JsonKey(name: 'note_source_youtube_url') String youtubeSourceLink,
      @JsonKey(name: 'task_id') String taskId});
}

/// @nodoc
class __$$NoteDtoImplCopyWithImpl<$Res>
    extends _$NoteDtoCopyWithImpl<$Res, _$NoteDtoImpl>
    implements _$$NoteDtoImplCopyWith<$Res> {
  __$$NoteDtoImplCopyWithImpl(
      _$NoteDtoImpl _value, $Res Function(_$NoteDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? emojiIcon = null,
    Object? description = null,
    Object? language = null,
    Object? creationDate = null,
    Object? textBlocks = null,
    Object? noteSource = null,
    Object? youtubeSourceLink = null,
    Object? taskId = null,
  }) {
    return _then(_$NoteDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      emojiIcon: null == emojiIcon
          ? _value.emojiIcon
          : emojiIcon // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as NoteLanguage,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      textBlocks: null == textBlocks
          ? _value._textBlocks
          : textBlocks // ignore: cast_nullable_to_non_nullable
              as List<NoteTextBlockDto>,
      noteSource: null == noteSource
          ? _value.noteSource
          : noteSource // ignore: cast_nullable_to_non_nullable
              as NoteSource,
      youtubeSourceLink: null == youtubeSourceLink
          ? _value.youtubeSourceLink
          : youtubeSourceLink // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteDtoImpl implements _NoteDto {
  const _$NoteDtoImpl(
      {@JsonKey(name: 'note_title') required this.title,
      @JsonKey(name: 'emoji') required this.emojiIcon,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'language')
      @NoteLanguageSerializer()
      required this.language,
      @JsonKey(name: 'date') @TimestampSerializer() required this.creationDate,
      @JsonKey(name: 'summary')
      required final List<NoteTextBlockDto> textBlocks,
      @JsonKey(name: 'note_source')
      @NoteSourceSerializer()
      required this.noteSource,
      @JsonKey(name: 'note_source_youtube_url') required this.youtubeSourceLink,
      @JsonKey(name: 'task_id') required this.taskId})
      : _textBlocks = textBlocks;

  factory _$NoteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteDtoImplFromJson(json);

  @override
  @JsonKey(name: 'note_title')
  final String title;
  @override
  @JsonKey(name: 'emoji')
  final String emojiIcon;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'language')
  @NoteLanguageSerializer()
  final NoteLanguage language;
  @override
  @JsonKey(name: 'date')
  @TimestampSerializer()
  final DateTime creationDate;
  final List<NoteTextBlockDto> _textBlocks;
  @override
  @JsonKey(name: 'summary')
  List<NoteTextBlockDto> get textBlocks {
    if (_textBlocks is EqualUnmodifiableListView) return _textBlocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textBlocks);
  }

  @override
  @JsonKey(name: 'note_source')
  @NoteSourceSerializer()
  final NoteSource noteSource;
  @override
  @JsonKey(name: 'note_source_youtube_url')
  final String youtubeSourceLink;
  @override
  @JsonKey(name: 'task_id')
  final String taskId;

  @override
  String toString() {
    return 'NoteDto(title: $title, emojiIcon: $emojiIcon, description: $description, language: $language, creationDate: $creationDate, textBlocks: $textBlocks, noteSource: $noteSource, youtubeSourceLink: $youtubeSourceLink, taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.emojiIcon, emojiIcon) ||
                other.emojiIcon == emojiIcon) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            const DeepCollectionEquality()
                .equals(other._textBlocks, _textBlocks) &&
            (identical(other.noteSource, noteSource) ||
                other.noteSource == noteSource) &&
            (identical(other.youtubeSourceLink, youtubeSourceLink) ||
                other.youtubeSourceLink == youtubeSourceLink) &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      emojiIcon,
      description,
      language,
      creationDate,
      const DeepCollectionEquality().hash(_textBlocks),
      noteSource,
      youtubeSourceLink,
      taskId);

  /// Create a copy of NoteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteDtoImplCopyWith<_$NoteDtoImpl> get copyWith =>
      __$$NoteDtoImplCopyWithImpl<_$NoteDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteDtoImplToJson(
      this,
    );
  }
}

abstract class _NoteDto implements NoteDto {
  const factory _NoteDto(
      {@JsonKey(name: 'note_title') required final String title,
      @JsonKey(name: 'emoji') required final String emojiIcon,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'language')
      @NoteLanguageSerializer()
      required final NoteLanguage language,
      @JsonKey(name: 'date')
      @TimestampSerializer()
      required final DateTime creationDate,
      @JsonKey(name: 'summary')
      required final List<NoteTextBlockDto> textBlocks,
      @JsonKey(name: 'note_source')
      @NoteSourceSerializer()
      required final NoteSource noteSource,
      @JsonKey(name: 'note_source_youtube_url')
      required final String youtubeSourceLink,
      @JsonKey(name: 'task_id') required final String taskId}) = _$NoteDtoImpl;

  factory _NoteDto.fromJson(Map<String, dynamic> json) = _$NoteDtoImpl.fromJson;

  @override
  @JsonKey(name: 'note_title')
  String get title;
  @override
  @JsonKey(name: 'emoji')
  String get emojiIcon;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'language')
  @NoteLanguageSerializer()
  NoteLanguage get language;
  @override
  @JsonKey(name: 'date')
  @TimestampSerializer()
  DateTime get creationDate;
  @override
  @JsonKey(name: 'summary')
  List<NoteTextBlockDto> get textBlocks;
  @override
  @JsonKey(name: 'note_source')
  @NoteSourceSerializer()
  NoteSource get noteSource;
  @override
  @JsonKey(name: 'note_source_youtube_url')
  String get youtubeSourceLink;
  @override
  @JsonKey(name: 'task_id')
  String get taskId;

  /// Create a copy of NoteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteDtoImplCopyWith<_$NoteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
