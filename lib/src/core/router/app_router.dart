import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:algoload_flutter_web_app/src/features/_barrel.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Modal|Screen|Dialog|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: OnboardingRoute.page, path: '/', initial: true),

        // AutoRoute(page: SettingsRoute.page, path: '/settings'),
        // AutoRoute(page: NotesListRoute.page, path: '/notesList'),
        // AutoRoute(page: SingleNoteRoute.page, path: '/note/:note'),

        // AutoRoute(page: CreateNoteWithYoutubeMethodRoute.page, path: '/createNote/youtube/'),
        // AutoRoute(page: CreateNoteWithAudioRecordRoute.page, path: '/createNote/audioRecord/'),
        // AutoRoute(page: CreateNoteWithAudioFileRoute.page, path: '/createNote/audioFile/'),

        AutoRoute(
          page: LoginRoute.page,
          path: '/login/',
          initial: true,
        ),

        AutoRoute(
          page: CreateNoteWithAudioRecordRoute.page,
          path: '/algoview/',
        ),
      ];
}
