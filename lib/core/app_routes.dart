import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yu_health/presentation/login_page/login_page.dart';
import 'package:yu_health/presentation/login_page/login_page_provider.dart';
import 'package:yu_health/presentation/main_page/main_page.dart';
import 'package:yu_health/presentation/register_page/register_page.dart';
import 'package:yu_health/presentation/register_page/register_page_provider.dart';

import '../presentation/splash_screen/splash_screen_page.dart';

class AppRoutes {
  const AppRoutes._();

  static const String kInitialRoute = "/";
  static const String kHomeRoute = "home-page-route";
  static const String kLoginRoute = "login-page-route";
  static const String kRegisterRoute = "register-page-route";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kInitialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreenPage();
          },
        );
      case kLoginRoute:
        return MaterialPageRoute(
          builder: (context) {
            return ChangeNotifierProvider<LoginPageProvider>(
              create: (context) => LoginPageProvider(),
              child: const LoginPage(),
            );
          },
        );
      case kRegisterRoute:
        return MaterialPageRoute(
          builder: (context) {
            return ChangeNotifierProvider<RegisterPageProvider>(
              create: (context) => RegisterPageProvider(),
              child: const RegisterPage(),
            );
          },
        );
      case kHomeRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const MainPage();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('Page not found :('),
              ),
            );
          },
        );
    }
  }
}
