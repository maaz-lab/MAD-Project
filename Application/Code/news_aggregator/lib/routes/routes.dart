import 'package:flutter/material.dart';
import '../view/home/home_screen.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.home:
        return getPageRoute(const HomeScreen());

      // case RoutesName.onBoarding:
      //   return getPageRoute(OnBoardingScreen());

      // case RoutesName.splash:
      //   return getPageRoute(const SplashScreen());

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