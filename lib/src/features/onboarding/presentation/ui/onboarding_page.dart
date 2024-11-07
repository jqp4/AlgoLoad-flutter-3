import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_with_ai/src/core/_barrel.dart';
import 'package:notes_app_with_ai/src/foundation/extensoins/context.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // tmp
    const String title = 'YouTube video summaries';
    const String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor';

    final theme = context.theme;
    final backgroundColor = theme.colorScheme.surface;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              title,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap.y(8),
            Text(
              description,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const Spacer(),
            MyButton(
              title: 'Continue',
              isExpanded: true,
              onPressed: () {
                // После онбординга направляем на главную страницу
                context.router.replace(const NotesListRoute());
              },
            ),
            const Gap.y(36),
          ],
        ),
      ),
    );
  }
}
