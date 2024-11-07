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

class CreateNoteWithAudioFileBloc extends Bloc<CreateNoteWithAudioFileEvent, CreateNoteWithAudioFileState> {
  CreateNoteWithAudioFileBloc({required this.mainNotesBloc}) : super(const CreateNoteWithAudioFileState.initial()) {
    on<_UpdateFilePathForm>(_updateFilePathForm);
    on<_UpdateLanguageForm>(_updateLanguageForm);
    on<_Submit>(_submitForm);
  }

  final NotesBloc mainNotesBloc;
  static final _log = Logger('CreateNoteWithAudioFileBloc');
  var _form = CreateNoteWithAudioFileForm.empty();
  CreateNoteWithAudioFileForm get form => _form;

  Future _updateFilePathForm(
    _UpdateFilePathForm event,
    Emitter<CreateNoteWithAudioFileState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _UpdateFilePathForm event');

    _form = _form.copyWith(audioFilePath: event.value);

    _log.info('_UpdateFilePathForm: new file path = ${_form.audioFilePath}');

    emit(const _Loaded());
  }

  Future _updateLanguageForm(
    _UpdateLanguageForm event,
    Emitter<CreateNoteWithAudioFileState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _UpdateLanguageForm event');

    _form = _form.copyWith(language: event.value);

    _log.info('_UpdateLanguageForm: new language = ${_form.language}');

    emit(const _Loaded());
  }

  Future _submitForm(
    _Submit event,
    Emitter<CreateNoteWithAudioFileState> emit,
  ) async {
    if (state is _Pending) return;
    emit(const _Pending());

    _log.info('Catch _SubmitForm event');

    final result = await inject<SendAudioFileTask>()(_form.audioFilePath, _form.language);

    if (result.isLeft()) {
      emit(_Failure(result.asLeft().description));
      return;
    }

    mainNotesBloc.add(const NotesEvent.read());
    emit(const _Completed());
  }
}
