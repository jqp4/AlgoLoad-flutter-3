import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes/presentation/_barrel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CreateNoteWithAudioFilePage extends StatelessWidget {
  const CreateNoteWithAudioFilePage({
    required this.notesBloc,
    super.key,
  });

  final NotesBloc notesBloc;

  @override
  Widget build(BuildContext context) {
    final loadingOverlay = inject<LoadingOverlay>();

    return BlocProvider<CreateNoteWithAudioFileBloc>(
      create: (_) => CreateNoteWithAudioFileBloc(mainNotesBloc: notesBloc),
      child: BlocConsumer<CreateNoteWithAudioFileBloc, CreateNoteWithAudioFileState>(
        listener: (context, state) {
          loadingOverlay.hide();

          state.whenOrNull(
            pending: () {
              // show loading indicator
              loadingOverlay.show(context);
            },
            completed: () {
              context.router.popUntilRoot();
            },
          );
        },
        builder: (context, state) {
          String? maybeFailureDescription;

          state.whenOrNull(
            failure: (failureDescription) {
              maybeFailureDescription = failureDescription;
            },
          );

          return AudioFileFormPage(
            maybeFailureDescription: maybeFailureDescription,
          );
        },
      ),
    );
  }
}
