import 'package:flutter/material.dart';
import 'package:news_aggregator/resources/constants/style.dart';
import '../../resources/constants/logos.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MyLogos.appLogo),
            Text(
              "News Time",
              style: Style.heading.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
