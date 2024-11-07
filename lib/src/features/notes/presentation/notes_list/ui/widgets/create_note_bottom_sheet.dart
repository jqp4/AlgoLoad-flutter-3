import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/_barrel.dart';

/// Menu for selecting how to create a new note on the notes list page.
/// Appears by pressing the “New Note” button.
class CreateNoteBottomSheet extends StatelessWidget {
  const CreateNoteBottomSheet({
    required this.notesBloc,
    super.key,
  });

  final NotesBloc notesBloc;

  @override
  Widget build(BuildContext context) {
    return BottomSheetListContent(
      items: [
        BottomSheetButtonItem(
          title: 'Upload audio file',
          leadingIcon: Icons.upload_rounded,
          onPressed: () {
            context.router.popAndPush(
              CreateNoteWithAudioFileRoute(notesBloc: notesBloc),
            );
          },
        ),
        BottomSheetButtonItem(
          title: 'Record new audio',
          leadingIcon: Icons.mic_rounded,
          onPressed: () {
            context.router.popAndPush(
              CreateNoteWithAudioRecordRoute(notesBloc: notesBloc),
            );
          },
        ),
        BottomSheetButtonItem(
          title: 'Via YouTube',
          leadingIcon: Icons.play_circle_outline_rounded,
          onPressed: () {
            context.router.popAndPush(
              CreateNoteWithYoutubeMethodRoute(notesBloc: notesBloc),
            );
          },
        ),
      ],
    );
  }
}
