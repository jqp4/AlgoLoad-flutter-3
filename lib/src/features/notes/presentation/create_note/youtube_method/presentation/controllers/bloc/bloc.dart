import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/domain/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/presentation/_barrel.dart';
import 'package:notes_app_with_ai/src/foundation/_barrel.dart';

part 'bloc.freezed.dart';
part 'event.part.dart';
part 'state.part.dart';

class CreateNoteWithYoutubeBloc extends Bloc<CreateNoteWithYoutubeEvent, CreateNoteWithYoutubeState> {
  CreateNoteWithYoutubeBloc({required this.mainNotesBloc}) : super(const CreateNoteWithYoutubeState.initial()) {
    on<_UpdateYoutubeLinkForm>(_updateYoutubeLinkForm);
    on<_UpdateLanguageForm>(_updateLanguageForm);
    on<_Submit>(_submitForm);
  }

  final NotesBloc mainNotesBloc;
  static final _log = Logger('CreateNoteWithYoutubeBloc');
  var _form = CreateNoteWithYoutubeForm.empty();
  CreateNoteWithYoutubeForm get form => _form;

  Future _updateYoutubeLinkForm(
    _UpdateYoutubeLinkForm event,
    Emitter<CreateNoteWithYoutubeState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _updateYoutubeLinkForm event');

    _form = _form.copyWith(youtubeUrl: event.value);
    emit(const _Loaded());
  }

  Future _updateLanguageForm(
    _UpdateLanguageForm event,
    Emitter<CreateNoteWithYoutubeState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _updateYoutubeLinkForm event');

    _form = _form.copyWith(language: event.value);
    emit(const _Loaded());
  }

  Future _submitForm(
    _Submit event,
    Emitter<CreateNoteWithYoutubeState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _SubmitForm event');

    final result = await inject<SendYoutubeTask>()(_form.youtubeUrl, _form.language);

    if (result.isLeft()) {
      emit(_Failure(result.asLeft().description));
      return;
    }

    mainNotesBloc.add(const NotesEvent.read());
    emit(const _Completed());
  }
}
