part of 'bloc.dart';

@freezed
class CreateNoteWithAudioFileState with _$CreateNoteWithAudioFileState {
  const factory CreateNoteWithAudioFileState.initial() = _Initial;

  const factory CreateNoteWithAudioFileState.pending() = _Pending;

  const factory CreateNoteWithAudioFileState.loaded() = _Loaded;

  const factory CreateNoteWithAudioFileState.failure(String failureDescription) = _Failure;

  const factory CreateNoteWithAudioFileState.completed() = _Completed;
}
