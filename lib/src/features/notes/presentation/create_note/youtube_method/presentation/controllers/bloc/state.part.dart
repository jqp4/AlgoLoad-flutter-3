part of 'bloc.dart';

@freezed
class CreateNoteWithYoutubeState with _$CreateNoteWithYoutubeState {
  const factory CreateNoteWithYoutubeState.initial() = _Initial;

  const factory CreateNoteWithYoutubeState.pending() = _Pending;

  const factory CreateNoteWithYoutubeState.loaded() = _Loaded;

  const factory CreateNoteWithYoutubeState.failure(String failureDescription) = _Failure;

  const factory CreateNoteWithYoutubeState.completed() = _Completed;
}
