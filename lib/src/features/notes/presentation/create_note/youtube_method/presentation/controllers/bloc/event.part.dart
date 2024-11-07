part of 'bloc.dart';

@freezed
class CreateNoteWithYoutubeEvent with _$CreateNoteWithYoutubeEvent {
  const factory CreateNoteWithYoutubeEvent.updateYoutubeLinkForm(String value) = _UpdateYoutubeLinkForm;

  const factory CreateNoteWithYoutubeEvent.updateLanguageForm(NoteLanguage value) = _UpdateLanguageForm;

  const factory CreateNoteWithYoutubeEvent.submit() = _Submit;
}
