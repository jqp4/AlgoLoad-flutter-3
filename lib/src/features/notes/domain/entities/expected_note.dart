import 'package:notes_app_with_ai/src/features/notes/domain/_barrel.dart';

class ExpectedNote extends Note {
  ExpectedNote({
    required super.taskId,
    required super.creationDate,
    String? title,
  }) : super(
          emojiIcon: '⌛️',
          title: title ?? 'New note, in progress...',
          description: 'ID: $taskId',
          isPendingProcessing: true,
          language: NoteLanguage.unknown,
          noteSource: NoteSource.unknown,
          youtubeSourceLink: 'null',
          textBlocks: const [],
        );
}
