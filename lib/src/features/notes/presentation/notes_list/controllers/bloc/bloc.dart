import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/domain/_barrel.dart';

part 'bloc.freezed.dart';
part 'event.part.dart';
part 'state.part.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(const NotesState.initial()) {
    on<_Read>(_readNotes);
    on<_Fetch>(_fetchExpectedNotes);
  }

  static final _log = MyWebLogger('NotesBloc');
  // int _expectedTasksCounter = 0;
  Future? _updater;

  Future _readNotes(
    _Read event,
    Emitter<NotesState> emit,
  ) async {
    _log.info('Catch _Read event');

    emit(const NotesState.pending());

    // final maybeNotes = await inject<ReadAllNotes>()();
    // if (maybeNotes.isLeft()) {
    //   emit(NotesState.failure(maybeNotes.asLeft().description));
    //   return;
    // }

    // final maybeExpectedTaskIds = await inject<ReadAllExpectedTaskIds>()();
    // if (maybeExpectedTaskIds.isLeft()) {
    //   emit(NotesState.failure(maybeExpectedTaskIds.asLeft().description));
    //   return;
    // }

    // final notes = maybeExpectedTaskIds
    //     .asRight()
    //     .map(
    //       (taskId) => ExpectedNote(
    //         taskId: taskId,
    //         // TODO: add real date
    //         creationDate: DateTime.now(),
    //       ) as Note,
    //     )
    //     .toList()
    //   ..addAll(maybeNotes.asRight());

    // _expectedTasksCounter = maybeExpectedTaskIds.asRight().length;
    // _log.finest('_Read: returns ${notes.length} notes');

    // TODO: remove delay
    await Future.delayed(const Duration(milliseconds: 400));
    // emit(NotesState.loaded(notes));
    emit(const NotesState.loaded([]));
  }

  Future _fetchExpectedNotes(
    _Fetch event,
    Emitter<NotesState> emit,
  ) async {
    if (_updater != null) return;
    _updater = Future(() {});
    _log.info('Catch _Fetch event');

    // final maybeExpectedTaskIds = await inject<ReadAllExpectedTaskIds>()();
    // if (maybeExpectedTaskIds.isLeft()) {
    //   emit(NotesState.failure(maybeExpectedTaskIds.asLeft().description));
    //   return;
    // } else if (maybeExpectedTaskIds.asRight().isEmpty) {
    //   return;
    // }

    // final results = await Future.wait(
    //   maybeExpectedTaskIds
    //       .asRight()
    //       .map(
    //         (taskId) => inject<FetchExpectedNote>()(taskId),
    //       )
    //       .toList(),
    // );

    // final fetchesAmount = results.where((e) => e.isRight()).length;
    // final failuresAmount = results.where((e) => e.isLeft()).length;

    // if (_expectedTasksCounter != failuresAmount) {
    //   _expectedTasksCounter = failuresAmount;
    //   add(const NotesEvent.read());
    // }

    // if (fetchesAmount > 0) {
    //   _log.finest('_Fetch: $fetchesAmount notes are fetched)');
    //   add(const NotesEvent.read());
    // }

    // if (failuresAmount > 0) {
    //   _log.warning('_Fetch: $failuresAmount notes are not fetched');
    //   _updater = Future.delayed(
    //     BuisinessConstants.notesRefetchDelayDuration,
    //     () {
    //       _updater = null;
    //       add(const NotesEvent.fetch());
    //     },
    //   );
    // }
  }
}
