import 'package:algoload_flutter_web_app/src/core/uikit/_barrel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: MyButton(
          title: 'Перейти обратно к заметкам',
          onPressed: () {
            // После настройки чего-либо направляем на главную страницу
            // context.router.replace(const NotesListRoute());
            context.router.maybePop();
          },
        ),
      ),
    );
  }
}
