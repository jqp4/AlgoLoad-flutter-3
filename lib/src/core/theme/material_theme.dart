import 'package:flutter/material.dart';

class MaterialTheme {
  const MaterialTheme(this.textTheme);

  final TextTheme textTheme;

  ThemeData get light => _createTheme(_lightScheme.toColorScheme());

  ThemeData get dark => _createTheme(_darkScheme.toColorScheme());

  static MaterialScheme get _lightScheme => const MaterialScheme(
        brightness: Brightness.light,
        primary: Color(0xFF00A3FF), // 0xff31628d
        surfaceTint: Color(0xff31628d),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffcfe5ff),
        onPrimaryContainer: Color(0xff001d33),
        secondary: Color(0xff526070),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffd5e4f7),
        onSecondaryContainer: Color(0xff0e1d2a),
        tertiary: Color(0xff695779),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffefdbff),
        onTertiaryContainer: Color(0xff231533),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff410002),
        surface: Color(0xfff7f9ff),
        onSurface: Color(0xff181c20),
        onSurfaceVariant: Color(0xFF666666),
        outline: Color(0xff72777f),
        outlineVariant: Color(0xffc2c7cf),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2d3135),
        onInverseSurface: Color(0xffeff1f6),
        inversePrimary: Color(0xff9ccbfb),
        primaryFixed: Color(0xffcfe5ff),
        onPrimaryFixed: Color(0xff001d33),
        primaryFixedDim: Color(0xff9ccbfb),
        onPrimaryFixedVariant: Color(0xff114a73),
        secondaryFixed: Color(0xffd5e4f7),
        onSecondaryFixed: Color(0xff0e1d2a),
        secondaryFixedDim: Color(0xffb9c8da),
        onSecondaryFixedVariant: Color(0xff3a4857),
        tertiaryFixed: Color(0xffefdbff),
        onTertiaryFixed: Color(0xff231533),
        tertiaryFixedDim: Color(0xffd4bee6),
        onTertiaryFixedVariant: Color(0xff504061),
        surfaceDim: Color(0xffd8dae0),
        surfaceBright: Color(0xfff7f9ff),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xfff2f3f9),
        surfaceContainer: Color(0xffeceef4),
        // surfaceContainer: Color(0xFFF3F3F3), // 0xffeceef4
        surfaceContainerHigh: Color(0xffe6e8ee),
        surfaceContainerHighest: Color(0xffe0e2e8),
      );

  static MaterialScheme get _darkScheme => const MaterialScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF00A3FF), // 0xff9ccbfb
        surfaceTint: Color(0xff9ccbfb),
        onPrimary: Color(0xff003354),
        primaryContainer: Color(0xff114a73),
        onPrimaryContainer: Color(0xffcfe5ff),
        secondary: Color(0xffb9c8da),
        onSecondary: Color(0xff243240),
        secondaryContainer: Color(0xff3a4857),
        onSecondaryContainer: Color(0xffd5e4f7),
        tertiary: Color(0xffd4bee6),
        onTertiary: Color(0xff392a49),
        tertiaryContainer: Color(0xff504061),
        onTertiaryContainer: Color(0xffefdbff),
        error: Color(0xffffb4ab),
        onError: Color(0xff690005),
        errorContainer: Color(0xff93000a),
        onErrorContainer: Color(0xffffdad6),
        surface: Color(0xff101418),
        onSurface: Color(0xffe0e2e8),
        onSurfaceVariant: Color(0xffc2c7cf),
        outline: Color(0xff8c9199),
        outlineVariant: Color(0xff42474e),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffe0e2e8),
        onInverseSurface: Color(0xff2d3135),
        inversePrimary: Color(0xff31628d),
        primaryFixed: Color(0xffcfe5ff),
        onPrimaryFixed: Color(0xff001d33),
        primaryFixedDim: Color(0xff9ccbfb),
        onPrimaryFixedVariant: Color(0xff114a73),
        secondaryFixed: Color(0xffd5e4f7),
        onSecondaryFixed: Color(0xff0e1d2a),
        secondaryFixedDim: Color(0xffb9c8da),
        onSecondaryFixedVariant: Color(0xff3a4857),
        tertiaryFixed: Color(0xffefdbff),
        onTertiaryFixed: Color(0xff231533),
        tertiaryFixedDim: Color(0xffd4bee6),
        onTertiaryFixedVariant: Color(0xff504061),
        surfaceDim: Color(0xff101418),
        surfaceBright: Color(0xff36393e),
        surfaceContainerLowest: Color(0xff0b0e12),
        surfaceContainerLow: Color(0xff181c20),
        surfaceContainer: Color(0xff1c2024),
        surfaceContainerHigh: Color(0xff272a2f),
        surfaceContainerHighest: Color(0xff32353a),
      );

  ThemeData _createTheme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.surface,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color surface;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color onInverseSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      surfaceTint: surfaceTint,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: onInverseSurface,
      inversePrimary: inversePrimary,
      primaryFixed: primaryFixed,
      onPrimaryFixed: onPrimaryFixed,
      primaryFixedDim: primaryFixedDim,
      onPrimaryFixedVariant: onPrimaryFixedVariant,
      secondaryFixed: secondaryFixed,
      onSecondaryFixed: onSecondaryFixed,
      secondaryFixedDim: secondaryFixedDim,
      onSecondaryFixedVariant: onSecondaryFixedVariant,
      tertiaryFixed: tertiaryFixed,
      onTertiaryFixed: onTertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim,
      onTertiaryFixedVariant: onTertiaryFixedVariant,
      surfaceDim: surfaceDim,
      surfaceBright: surfaceBright,
      surfaceContainerLowest: surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow,
      surfaceContainer: surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh,
      surfaceContainerHighest: surfaceContainerHighest,
    );
  }
}
