import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/features/_barrel.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Modal|Screen|Dialog|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: OnboardingRoute.page, path: '/', initial: true),
        // // TODO:
        // // AutoRoute(page: PaymentRoute.page, path: '/payment'),

        // AutoRoute(page: SettingsRoute.page, path: '/settings'),
        // AutoRoute(page: NotesListRoute.page, path: '/notesList'),
        // AutoRoute(page: SingleNoteRoute.page, path: '/note/:note'),

        // AutoRoute(page: CreateNoteWithYoutubeMethodRoute.page, path: '/createNote/youtube/'),
        // AutoRoute(page: CreateNoteWithAudioRecordRoute.page, path: '/createNote/audioRecord/'),
        // AutoRoute(page: CreateNoteWithAudioFileRoute.page, path: '/createNote/audioFile/'),

        AutoRoute(
          page: CreateNoteWithAudioRecordRoute.page,
          path: '/createNote/audioRecord/',
          initial: true,
        ),
      ];
}
