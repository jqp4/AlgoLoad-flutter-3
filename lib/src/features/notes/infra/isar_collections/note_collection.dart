import 'package:isar/isar.dart';
import 'package:notes_app_with_ai/src/features/notes/domain/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/infra/_barrel.dart';

part 'note_collection.g.dart';

@collection
class NoteCollection {
  Id id = Isar.autoIncrement;

  late final String taskId;
  late final String title;
  late final String emojiIcon;
  late final String description;
  late final DateTime creationDate;
  late final List<NoteTextBlockCollection> textBlocks;

  @enumerated
  late final NoteLanguage language;

  @enumerated
  late final NoteSource noteSource;
  late final String youtubeSourceLink;
}

extension NoteCollectionY on NoteCollection {
  Note toEntity() {
    return Note(
      title: title,
      emojiIcon: emojiIcon,
      description: description,
      language: language,
      creationDate: creationDate,
      textBlocks: textBlocks.map((e) => e.toEntity()).toList(),
      youtubeSourceLink: youtubeSourceLink,
      noteSource: noteSource,
      taskId: taskId,
      storageId: id,
    );
  }
}

extension NoteY on Note {
  NoteCollection toCollection() {
    return NoteCollection()
      ..title = title
      ..emojiIcon = emojiIcon
      ..description = description
      ..language = language
      ..creationDate = creationDate
      ..textBlocks = textBlocks.map((e) => e.toCollection()).toList()
      ..noteSource = noteSource
      ..taskId = taskId
      ..youtubeSourceLink = youtubeSourceLink;
  }
}
