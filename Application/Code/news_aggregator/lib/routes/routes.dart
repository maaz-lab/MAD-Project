import 'package:flutter/material.dart';
import '../view/home/home_screen.dart';
import '../view/main/main_screen.dart';
import '../view/splash/splash_screen.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.splash:
        return getPageRoute(const SplashScreen());

      case RoutesName.home:
        return getPageRoute(const HomeScreen());

      case RoutesName.main:
        return getPageRoute(const MainScreen());

      // case RoutesName.login:
      //   return getPageRoute(LoginScreen());

      // case RoutesName.signup:
      //   return getPageRoute(SignUpScreen());

      // case RoutesName.forgotPassword:
      //   return getPageRoute(ForgotPasswordScreen());

      default:
        return getPageRoute(const HomeScreen());
    }
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}