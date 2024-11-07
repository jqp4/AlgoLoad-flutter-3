part of 'bloc.dart';

@freezed
class NotesEvent with _$NotesEvent {
  const factory NotesEvent.read() = _Read;

  const factory NotesEvent.fetch() = _Fetch;
}
