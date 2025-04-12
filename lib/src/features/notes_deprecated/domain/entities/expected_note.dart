import 'package:algoload_flutter_web_app/src/features/notes_deprecated/domain/_barrel.dart';

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
