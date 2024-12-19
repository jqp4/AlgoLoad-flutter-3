import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes/_barrel.dart';

@RoutePage()
class SingleNotePage extends StatelessWidget {
  const SingleNotePage({
    required this.noteStorageId,
    required this.notesBloc,
    super.key,
  });

  final int noteStorageId;
  final NotesBloc notesBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SingleNoteBloc>(
      create: (_) => SingleNoteBloc(
        noteStorageId: noteStorageId,
        mainNotesBloc: notesBloc,
      )..add(const SingleNoteEvent.read()),
      child: BlocConsumer<SingleNoteBloc, SingleNoteState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (failureDescription) {
              context.showSnackbar(failureDescription);
            },
            redirect: (newNoteStorageId) {
              context.router
                ..popUntilRoot()
                ..push(
                  SingleNoteRoute(
                    noteStorageId: newNoteStorageId,
                    notesBloc: notesBloc,
                  ),
                );
            },
            exit: () {
              context.router.popUntilRoot();
            },
          );
        },
        builder: (context, state) {
          return state.whenOrNull<Widget>(
                loaded: (note) => NoteDetailPage(note: note),
              ) ??
              const PendingSingleNotePage();
        },
      ),
    );
  }
}
