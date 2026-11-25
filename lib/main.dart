
import 'package:flutter/material.dart';

import 'splash_pages.dart';
import 'pages/login_page.dart';
import 'pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Login App',

      initialRoute: '/',

      onGenerateRoute: (settings) {
        Widget halaman;

        switch (settings.name) {
          case '/':
            halaman = const SplashPages();
            break;

          case '/login':
            halaman = const LoginPage();
            break;

          case '/home':
            halaman = const MyHomePage();
            break;

          default:
            halaman = const LoginPage();
        }

        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return halaman;
          },

          transitionDuration: const Duration(milliseconds: 400),

          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {

            final gerakan = Tween<Offset>(
              begin: const Offset(0.05, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            );

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: gerakan,
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
