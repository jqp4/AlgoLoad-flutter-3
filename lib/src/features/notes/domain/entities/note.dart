// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:algoload_flutter_web_app/src/features/notes/domain/entities/_barrel.dart';

class Note {
  const Note({
    required this.title,
    required this.emojiIcon,
    required this.description,
    required this.language,
    required this.creationDate,
    required this.textBlocks,
    required this.noteSource,
    required this.youtubeSourceLink,
    required this.taskId,
    this.storageId,
    this.isPendingProcessing = false,
  });

  final String title;
  final String emojiIcon;
  final String description;
  final NoteLanguage language;
  final DateTime creationDate;

  final List<NoteTextBlock> textBlocks;

  final NoteSource noteSource;
  final String youtubeSourceLink;

  final String taskId;
  final int? storageId;
  final bool isPendingProcessing;

  Note copyWith({
    String? title,
    String? emojiIcon,
    String? description,
    NoteLanguage? language,
    DateTime? creationDate,
    List<NoteTextBlock>? textBlocks,
    NoteSource? noteSource,
    String? youtubeSourceLink,
    String? taskId,
    int? storageId,
    bool? isPendingProcessing,
  }) {
    return Note(
      title: title ?? this.title,
      emojiIcon: emojiIcon ?? this.emojiIcon,
      description: description ?? this.description,
      language: language ?? this.language,
      creationDate: creationDate ?? this.creationDate,
      textBlocks: textBlocks ?? this.textBlocks,
      noteSource: noteSource ?? this.noteSource,
      youtubeSourceLink: youtubeSourceLink ?? this.youtubeSourceLink,
      taskId: taskId ?? this.taskId,
      storageId: storageId ?? this.storageId,
      isPendingProcessing: isPendingProcessing ?? this.isPendingProcessing,
    );
  }
}
