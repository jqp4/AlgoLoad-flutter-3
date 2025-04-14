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
  static const double _menuWidth = 250.0;
  bool _isMenuOpen = false;

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

  void toggleMenu() {
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
                                  toggleMenu();
                                  context.router.replace(const AlgoViewMainRoute());
                                },
                              ),
                              const Gap.y(16),
                              MyOutlinedButton(
                                title: 'Reports',
                                onPressed: () async {
                                  toggleMenu();

                                  final Uri url = Uri.parse('https://algoload.parallel.ru/upload_report');
                                  if (!await launchUrl(url, webOnlyWindowName: '_blank')) {
                                    // Показываем сообщение об ошибке, если не удалось открыть ссылку
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Не удалось открыть $url')),
                                      );
                                    }
                                  }
                                },
                              ),
                              const Gap.y(16),
                              MyOutlinedButton(
                                title: 'Help',
                                onPressed: () {
                                  toggleMenu();
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
                            toggleMenu();
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
            toggleMenu();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: false,
            leading: AppBarSideMenuButton(
              onPressed: toggleMenu,
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
