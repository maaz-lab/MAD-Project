import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'routes/routes_name.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarBrightness: Brightness.dark, // Dark text for status bar
    ));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Aggregator',
      initialRoute: RoutesName.main,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
