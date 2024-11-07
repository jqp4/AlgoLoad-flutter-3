import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/features/notes/presentation/_barrel.dart';

/// Menu for selecting actions on the note page.
/// Appears by pressing the “more” button.
class NoteMoreBottomSheet extends StatelessWidget {
  const NoteMoreBottomSheet({
    required this.bloc,
    super.key,
  });

  final SingleNoteBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BottomSheetListContent(
      items: [
        BottomSheetButtonItem(
          title: 'Copy',
          leadingIcon: Icons.copy_rounded,
          onPressed: () {
            bloc.add(const SingleNoteEvent.copy());
          },
        ),
        BottomSheetButtonItem(
          title: 'Delete',
          leadingIcon: Icons.delete_outline_rounded,
          onPressed: () {
            bloc.add(const SingleNoteEvent.delete());
          },
        ),
        BottomSheetButtonItem(
          title: 'Share',
          leadingIcon: Icons.share_outlined,
          onPressed: () {
            bloc.add(const SingleNoteEvent.share());
          },
        ),
      ],
    );
  }
}
