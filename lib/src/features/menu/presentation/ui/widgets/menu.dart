// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:algoload_flutter_web_app/src/features/auth/_barrel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenuScaffold extends StatefulWidget {
  const SideMenuScaffold({
    required this.title,
    required this.body,
    super.key,
  });

  final String title;
  final Widget body;

  @override
  State<SideMenuScaffold> createState() => _SideMenuScaffoldState();
}

class _SideMenuScaffoldState extends State<SideMenuScaffold> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  bool _isMenuOpen = false;

  static const _menuWidth = 250.0;
  static final _log = MyWebLogger('SideMenu');
  static const _reportsUrl = 'https://algoload.parallel.ru/upload_report';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(
      begin: 0,
      end: _menuWidth,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: (MediaQuery.of(context).size.width - _menuWidth) / MediaQuery.of(context).size.width,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openUrlWithLauncher(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      // Сначала пытаемся использовать плагин url_launcher
      if (await launchUrl(uri, webOnlyWindowName: '_blank')) {
        _log.info('launchUrl - OK');
      } else {
        _log.severe('launchUrl - FAIL');

        // Если плагин не сработал, используем JavaScript
        _openUrlWithJs(uri.toString());
      }
    } catch (e) {
      _log.severe('launchUrl - ERROR: $e');

      // В случае ошибки используем JavaScript
      _openUrlWithJs(uri.toString());
    }
  }

  // Запасной метод для открытия URL в веб-версии с использованием JavaScript
  void _openUrlWithJs(String url) {
    try {
      js.context.callMethod('open', [url, '_blank']);
      _log.info('_openUrlWithJs - OK');
    } on Exception catch (e) {
      _log.info('_openUrlWithJs - ERROR: $e');
    }
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_slideAnimation, _scaleAnimation]),
      builder: (context, child) {
        return Stack(
          children: [
            // Меню
            SizedBox(
              width: _menuWidth,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border(
                    right: BorderSide(
                      color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Menu',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              const Gap.y(32),
                              MyOutlinedButton(
                                title: 'AlgoLoad',
                                onPressed: () {
                                  _toggleMenu();
                                  context.router.replace(const AlgoViewMainRoute());
                                },
                              ),
                              const Gap.y(16),
                              MyOutlinedButton(
                                title: 'Reports',
                                onPressed: () async {
                                  _toggleMenu();

                                  _openUrlWithLauncher(_reportsUrl);
                                },
                              ),
                              const Gap.y(16),
                              MyOutlinedButton(
                                title: 'Help',
                                onPressed: () {
                                  _toggleMenu();
                                  // todo: replace to help page
                                  context.router.replace(const AlgoViewMainRoute());
                                },
                              ),
                            ],
                          ),
                        ),
                        MyOutlinedButton(
                          title: 'Logout',
                          onPressed: () {
                            _toggleMenu();
                            AuthBloc().add(const AuthEvent.logout());
                            Future.delayed(
                              const Duration(milliseconds: 450),
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
              ),
            ),
            // Основной контент
            Transform.translate(
              offset: Offset(_slideAnimation.value, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - _slideAnimation.value,
                child: child,
              ),
            ),
          ],
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_isMenuOpen) {
            _toggleMenu();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: false,
            leading: AppBarSideMenuButton(
              onPressed: _toggleMenu,
            ),
          ),
          body: widget.body,
        ),
      ),
    );
  }
}

class AppBarSideMenuButton extends StatelessWidget {
  const AppBarSideMenuButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
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
