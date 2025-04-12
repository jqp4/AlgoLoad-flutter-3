import 'dart:async';

import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes_deprecated/domain/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes_deprecated/presentation/_barrel.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc.freezed.dart';
part 'event.part.dart';
part 'state.part.dart';

class SingleNoteBloc extends Bloc<SingleNoteEvent, SingleNoteState> {
  SingleNoteBloc({
    required this.noteStorageId,
    required this.mainNotesBloc,
  }) : super(const SingleNoteState.initial()) {
    on<_Read>(_read);
    on<_Copy>(_copy);
    on<_Delete>(_delete);
    on<_Share>(_share);
  }

  final int noteStorageId;
  final NotesBloc mainNotesBloc;
  static final _log = MyWebLogger('SingleNoteBloc');

  Future _read(
    _Read event,
    Emitter<SingleNoteState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const SingleNoteState.pending());
    _log.info('Catch _Read event');

    // final maybeNote = await inject<ReadNote>()(noteStorageId);
    // if (maybeNote.isLeft()) {
    //   emit(SingleNoteState.failure(maybeNote.asLeft().description));
    //   return;
    // }

    // // TODO: remove delay
    // await Future.delayed(const Duration(milliseconds: 400));

    // _log.finest('_Read: done');
    // emit(SingleNoteState.loaded(maybeNote.asRight()));
  }

  Future _copy(
    _Copy event,
    Emitter<SingleNoteState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const SingleNoteState.pending());
    _log.info('Catch _Copy event');

    // final maybeCopiedNoteId = await inject<CopyNote>()(noteStorageId);
    // if (maybeCopiedNoteId.isLeft()) {
    //   emit(SingleNoteState.failure(maybeCopiedNoteId.asLeft().description));
    //   return;
    // }

    // mainNotesBloc.add(const NotesEvent.read());
    // emit(SingleNoteState.redirect(maybeCopiedNoteId.asRight()));
    // _log.finest('_Copy: done');
  }

  Future _delete(
    _Delete event,
    Emitter<SingleNoteState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const SingleNoteState.pending());
    _log.info('Catch _Delete event');

    // final maybeCopiedNoteId = await inject<DeleteNote>()(noteStorageId);
    // if (maybeCopiedNoteId.isLeft()) {
    //   emit(SingleNoteState.failure(maybeCopiedNoteId.asLeft().description));
    //   return;
    // }

    // mainNotesBloc.add(const NotesEvent.read());
    // emit(const SingleNoteState.exit());
    // _log.finest('_Delete: done');
  }

  Future _share(
    _Share event,
    Emitter<SingleNoteState> emit,
  ) async {
    // TODO:
  }
}
