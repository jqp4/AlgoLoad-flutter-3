import 'package:algoload_flutter_web_app/src/features/_barrel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Modal|Screen|Dialog|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // AutoRoute(page: SettingsRoute.page, path: '/settings'),
        // AutoRoute(page: OnboardingRoute.page, path: '/onboarding'),

        // AutoRoute(page: NotesListRoute.page, path: '/notesList'),
        // AutoRoute(page: SingleNoteRoute.page, path: '/note/:note'),

        AutoRoute(
          page: LoginRoute.page,
          path: '/login/',
          initial: true,
        ),

        AutoRoute(
          page: AlgoViewMainRoute.page,
          path: '/algoview/',
        ),
      ];
}
