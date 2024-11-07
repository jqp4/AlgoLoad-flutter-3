import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app_with_ai/src/foundation/extensoins/context.dart';

/// Use with Google Fonts package to use downloadable fonts
TextTheme createTextTheme(BuildContext context, String bodyFontString, String displayFontString) {
  final TextTheme baseTextTheme = context.theme.textTheme;
  final TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  final TextTheme displayTextTheme = GoogleFonts.getTextTheme(displayFontString, baseTextTheme);

  final TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );

  return textTheme;
}
