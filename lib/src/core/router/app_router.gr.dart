// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CreateNoteWithAudioFilePage]
class CreateNoteWithAudioFileRoute
    extends PageRouteInfo<CreateNoteWithAudioFileRouteArgs> {
  CreateNoteWithAudioFileRoute({
    required NotesBloc notesBloc,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateNoteWithAudioFileRoute.name,
          args: CreateNoteWithAudioFileRouteArgs(
            notesBloc: notesBloc,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateNoteWithAudioFileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateNoteWithAudioFileRouteArgs>();
      return CreateNoteWithAudioFilePage(
        notesBloc: args.notesBloc,
        key: args.key,
      );
    },
  );
}

class CreateNoteWithAudioFileRouteArgs {
  const CreateNoteWithAudioFileRouteArgs({
    required this.notesBloc,
    this.key,
  });

  final NotesBloc notesBloc;

  final Key? key;

  @override
  String toString() {
    return 'CreateNoteWithAudioFileRouteArgs{notesBloc: $notesBloc, key: $key}';
  }
}

/// generated route for
/// [CreateNoteWithAudioRecordPage]
class CreateNoteWithAudioRecordRoute extends PageRouteInfo<void> {
  const CreateNoteWithAudioRecordRoute({List<PageRouteInfo>? children})
      : super(
          CreateNoteWithAudioRecordRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateNoteWithAudioRecordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateNoteWithAudioRecordPage();
    },
  );
}

/// generated route for
/// [CreateNoteWithYoutubeMethodPage]
class CreateNoteWithYoutubeMethodRoute
    extends PageRouteInfo<CreateNoteWithYoutubeMethodRouteArgs> {
  CreateNoteWithYoutubeMethodRoute({
    required NotesBloc notesBloc,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateNoteWithYoutubeMethodRoute.name,
          args: CreateNoteWithYoutubeMethodRouteArgs(
            notesBloc: notesBloc,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateNoteWithYoutubeMethodRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateNoteWithYoutubeMethodRouteArgs>();
      return CreateNoteWithYoutubeMethodPage(
        notesBloc: args.notesBloc,
        key: args.key,
      );
    },
  );
}

class CreateNoteWithYoutubeMethodRouteArgs {
  const CreateNoteWithYoutubeMethodRouteArgs({
    required this.notesBloc,
    this.key,
  });

  final NotesBloc notesBloc;

  final Key? key;

  @override
  String toString() {
    return 'CreateNoteWithYoutubeMethodRouteArgs{notesBloc: $notesBloc, key: $key}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [NotesListPage]
class NotesListRoute extends PageRouteInfo<void> {
  const NotesListRoute({List<PageRouteInfo>? children})
      : super(
          NotesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotesListPage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [SingleNotePage]
class SingleNoteRoute extends PageRouteInfo<SingleNoteRouteArgs> {
  SingleNoteRoute({
    required int noteStorageId,
    required NotesBloc notesBloc,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SingleNoteRoute.name,
          args: SingleNoteRouteArgs(
            noteStorageId: noteStorageId,
            notesBloc: notesBloc,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleNoteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SingleNoteRouteArgs>();
      return SingleNotePage(
        noteStorageId: args.noteStorageId,
        notesBloc: args.notesBloc,
        key: args.key,
      );
    },
  );
}

class SingleNoteRouteArgs {
  const SingleNoteRouteArgs({
    required this.noteStorageId,
    required this.notesBloc,
    this.key,
  });

  final int noteStorageId;

  final NotesBloc notesBloc;

  final Key? key;

  @override
  String toString() {
    return 'SingleNoteRouteArgs{noteStorageId: $noteStorageId, notesBloc: $notesBloc, key: $key}';
  }
}
