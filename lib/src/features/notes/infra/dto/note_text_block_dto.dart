import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app_with_ai/src/features/notes/domain/_barrel.dart';

part 'note_text_block_dto.freezed.dart';
part 'note_text_block_dto.g.dart';

@freezed
class NoteTextBlockDto with _$NoteTextBlockDto {
  const factory NoteTextBlockDto({
    @JsonKey(name: 'title') required String subtitle,
    @JsonKey(name: 'time') required String timing,
    @JsonKey(name: 'texts') required List<String> texts,
  }) = _NoteTextBlockDto;

  factory NoteTextBlockDto.fromJson(Map<String, dynamic> json) => _$NoteTextBlockDtoFromJson(json);
}

extension NoteTextBlockX on NoteTextBlock {
  NoteTextBlockDto toDto() => NoteTextBlockDto(
        subtitle: subtitle,
        timing: timing,
        texts: texts,
      );
}

extension NoteTextBlockDtoX on NoteTextBlockDto {
  NoteTextBlock toEntity() => NoteTextBlock(
        subtitle: subtitle,
        timing: timing,
        texts: texts,
      );
}
