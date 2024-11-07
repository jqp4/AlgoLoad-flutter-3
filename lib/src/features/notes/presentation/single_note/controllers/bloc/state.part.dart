part of 'bloc.dart';

@freezed
class SingleNoteState with _$SingleNoteState {
  const factory SingleNoteState.initial() = _Initial;

  const factory SingleNoteState.pending() = _Pending;

  const factory SingleNoteState.loaded(Note note) = _Loaded;

  const factory SingleNoteState.failure(String failureDescription) = _Failure;

  const factory SingleNoteState.redirect(int noteStorageId) = _Redirect;

  const factory SingleNoteState.exit() = _Exit;
}
