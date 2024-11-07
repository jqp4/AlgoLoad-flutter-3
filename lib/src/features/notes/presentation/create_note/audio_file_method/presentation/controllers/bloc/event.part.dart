part of 'bloc.dart';

@freezed
class CreateNoteWithAudioFileEvent with _$CreateNoteWithAudioFileEvent {
  const factory CreateNoteWithAudioFileEvent.updateFilePathForm(String value) = _UpdateFilePathForm;

  const factory CreateNoteWithAudioFileEvent.updateLanguageForm(NoteLanguage value) = _UpdateLanguageForm;

  const factory CreateNoteWithAudioFileEvent.submit() = _Submit;
}
