import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/_barrel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppDrawerMenu extends StatelessWidget {
  const AppDrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Меню с кнопками
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menu',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Gap.y(32),
                    AppDrawerMenuOptionButton(
                      title: 'AlgoLoad',
                      onPressed: () {
                        Navigator.pop(context); // Закрываем меню
                      },
                    ),
                    const Gap.y(16),
                    AppDrawerMenuOptionButton(
                      title: 'Reports',
                      onPressed: () {
                        Navigator.pop(context); // Закрываем меню
                      },
                    ),
                    const Gap.y(16),
                    AppDrawerMenuOptionButton(
                      title: 'Help',
                      onPressed: () {
                        Navigator.pop(context); // Закрываем меню
                      },
                    ),
                    const Gap.y(16),
                    AppDrawerMenuOptionButton(
                      title: 'Old site version',
                      onPressed: () {
                        Navigator.pop(context); // Закрываем меню
                      },
                    ),
                  ],
                ),
              ),
              // Кнопка Logout внизу меню
              AppDrawerMenuOptionButton(
                title: 'Logout',
                onPressed: () {
                  AuthBloc().add(const AuthEvent.logout());
                  Future.delayed(
                    const Duration(milliseconds: 150),
                    () {
                      context.router
                        ..popUntilRoot()
                        ..replace(const LoginRoute());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDrawerMenuOptionButton extends StatelessWidget {
  const AppDrawerMenuOptionButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)), // Полностью круглая граница
        ),
        side: BorderSide(
          color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
          width: 1.0,
        ),
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class AppBarMenuButton extends StatelessWidget {
  const AppBarMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Закругленная граница с радиусом 8
          ),
          side: BorderSide(
            color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
            width: 1.0,
          ),
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(8),
          minimumSize: const Size(40, 40),
        ),
        child: Icon(
          Icons.menu,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
    );
  }
}
