import 'package:algoload_flutter_web_app/src/features/notes_deprecated/domain/_barrel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
