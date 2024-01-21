import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/routes_name.dart';
import 'routes/routes.dart';
import 'theme/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final isDark = preferences.getBool("isDark") ?? false;
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({super.key, this.isDark = false});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: ChangeNotifierProvider(
            create: (context) => ThemeProvider(isDark: isDark),
            builder: (context, child) {
              final theme = Provider.of<ThemeProvider>(context);
              
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'News Aggregator',
                theme: theme.currentTheme,
                initialRoute: RoutesName.main,
                onGenerateRoute: Routes.generateRoute,
              );
            }));
  }
}
