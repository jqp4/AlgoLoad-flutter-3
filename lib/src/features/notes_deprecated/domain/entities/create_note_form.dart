import 'package:algoload_flutter_web_app/src/features/notes_deprecated/domain/_barrel.dart';

abstract class CreateNoteForm {
  const CreateNoteForm();

  //Error: Only JS interop members may be 'external'.
  //Try removing the 'external' keyword or adding a JS interop annotation.

  // external factory CreateNoteForm.empty();

  // external CreateNoteForm copyWith();
}

class CreateNoteWithYoutubeForm extends CreateNoteForm {
  const CreateNoteWithYoutubeForm({
    required this.language,
    required this.youtubeUrl,
  });

  factory CreateNoteWithYoutubeForm.empty() => const CreateNoteWithYoutubeForm(
        language: NoteLanguage.english,
        youtubeUrl: '',
      );

  final NoteLanguage language;
  final String youtubeUrl;

  CreateNoteWithYoutubeForm copyWith({
    NoteLanguage? language,
    String? youtubeUrl,
  }) {
    return CreateNoteWithYoutubeForm(
      language: language ?? this.language,
      youtubeUrl: youtubeUrl ?? this.youtubeUrl,
    );
  }
}

class CreateNoteWithAudioFileForm extends CreateNoteForm {
  const CreateNoteWithAudioFileForm({
    required this.language,
    required this.audioFilePath,
  });

  factory CreateNoteWithAudioFileForm.empty() => const CreateNoteWithAudioFileForm(
        language: NoteLanguage.english,
        audioFilePath: '',
      );

  final NoteLanguage language;
  final String audioFilePath;

  CreateNoteWithAudioFileForm copyWith({
    NoteLanguage? language,
    String? audioFilePath,
  }) {
    return CreateNoteWithAudioFileForm(
      language: language ?? this.language,
      audioFilePath: audioFilePath ?? this.audioFilePath,
    );
  }
}

class CreateNoteWithAudioRecordForm extends CreateNoteForm {
  const CreateNoteWithAudioRecordForm({
    required this.language,
  });

  factory CreateNoteWithAudioRecordForm.empty() => const CreateNoteWithAudioRecordForm(
        language: NoteLanguage.english,
      );

  final NoteLanguage language;

  CreateNoteWithAudioRecordForm copyWith({
    NoteLanguage? language,
  }) {
    return CreateNoteWithAudioRecordForm(
      language: language ?? this.language,
    );
  }
}
