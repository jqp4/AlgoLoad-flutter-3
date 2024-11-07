import 'package:isar/isar.dart';
import 'package:notes_app_with_ai/src/features/notes/_barrel.dart';

part 'note_text_block_collection.g.dart';

@embedded
class NoteTextBlockCollection {
  late final String subtitle;
  late final String timing;
  late final List<String> texts;
}

extension NoteTextBlockCollectionY on NoteTextBlockCollection {
  NoteTextBlock toEntity() {
    return NoteTextBlock(
      subtitle: subtitle,
      timing: timing,
      texts: texts,
    );
  }
}

extension NoteTextBlockY on NoteTextBlock {
  NoteTextBlockCollection toCollection() {
    return NoteTextBlockCollection()
      ..subtitle = subtitle
      ..timing = timing
      ..texts = texts;
  }
}
