import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app_with_ai/src/features/notes/domain/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/infra/_barrel.dart';

part 'note_dto.freezed.dart';
part 'note_dto.g.dart';

@freezed
class NoteDto with _$NoteDto {
  const factory NoteDto({
    @JsonKey(name: 'note_title') required String title,
    @JsonKey(name: 'emoji') required String emojiIcon,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'language') @NoteLanguageSerializer() required NoteLanguage language,
    @JsonKey(name: 'date') @TimestampSerializer() required DateTime creationDate,
    @JsonKey(name: 'summary') required List<NoteTextBlockDto> textBlocks,
    @JsonKey(name: 'note_source') @NoteSourceSerializer() required NoteSource noteSource,
    @JsonKey(name: 'note_source_youtube_url') required String youtubeSourceLink,
    @JsonKey(name: 'task_id') required String taskId,
  }) = _NoteDto;

  factory NoteDto.fromJson(Map<String, dynamic> json) => _$NoteDtoFromJson(json);
}

extension NoteX on Note {
  NoteDto toDto() => NoteDto(
        title: title,
        emojiIcon: emojiIcon,
        description: description,
        language: language,
        creationDate: creationDate,
        textBlocks: textBlocks.map((e) => e.toDto()).toList(),
        noteSource: noteSource,
        taskId: taskId,
        youtubeSourceLink: youtubeSourceLink,
      );
}

extension NoteDtoX on NoteDto {
  Note toEntity() => Note(
        title: title,
        emojiIcon: emojiIcon,
        description: description,
        language: language,
        creationDate: creationDate,
        textBlocks: textBlocks.map((e) => e.toEntity()).toList(),
        noteSource: noteSource,
        taskId: taskId,
        youtubeSourceLink: youtubeSourceLink,
      );
}
