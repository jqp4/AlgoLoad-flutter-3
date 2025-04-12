part of 'bloc.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.initial() = _Initial;

  const factory NotesState.pending() = _Pending;

  const factory NotesState.loaded(List<Note> notes) = _Loaded;

  const factory NotesState.failure(String failureDescription) = _Failure;
}
