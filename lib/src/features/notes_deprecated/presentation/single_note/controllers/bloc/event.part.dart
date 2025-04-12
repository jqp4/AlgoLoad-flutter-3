part of 'bloc.dart';

@freezed
class SingleNoteEvent with _$SingleNoteEvent {
  const factory SingleNoteEvent.read() = _Read;

  const factory SingleNoteEvent.copy() = _Copy;

  const factory SingleNoteEvent.delete() = _Delete;

  const factory SingleNoteEvent.share() = _Share;
}
