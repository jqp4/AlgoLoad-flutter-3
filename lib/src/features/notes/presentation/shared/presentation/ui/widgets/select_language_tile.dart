import 'package:flutter/material.dart';
import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/notes/_barrel.dart';
import 'package:algoload_flutter_web_app/src/foundation/extensoins/context.dart';

class SelectLanguageTileButton extends StatelessWidget {
  const SelectLanguageTileButton({
    required this.initialLanguage,
    required this.onPressed,
    super.key,
  });

  final NoteLanguage initialLanguage;
  final void Function(NoteLanguage language) onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return StandartTileButton(
      onPressed: () {
        // TODO:
        // onPressed(NoteLanguage.english);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Select language',
            style: theme.textTheme.bodyLarge,
          ),
          const Gap.x(16.0),
          Text(
            // TODO: add language icon
            initialLanguage.name,
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
