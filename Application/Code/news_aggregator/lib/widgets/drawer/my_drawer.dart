import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/constants/logos.dart';
import '../../resources/constants/style.dart';
import '../../theme/theme_provider.dart';
import '../drawer_card/drawer_card.dart';

class MyDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const MyDrawer({super.key, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Container(
      width: 300,
      color: isDark ? Style.darkColor : Style.drawerColor,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => scaffoldKey?.currentState?.closeDrawer(),
                    icon: const Icon(Icons.close))
              ],
            ),
            Style.space10,
            Consumer<ThemeProvider>(
              builder: (context, value, child) {
                final isDark = value.currentTheme == ThemeData.dark();

                return DrawerCard(
                  icon: isDark ? Icons.light_mode : Icons.dark_mode,
                  iconColor: isDark ? Colors.amber : Style.darkColor,
                  title: isDark ? "Light Mode" : "Dark Mode",
                  isToggle: true,
                  onTap: () => value.toggleTheme(),
                );
              },
            ),
            Container(
                height: 1,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: const Drawer(
                  backgroundColor: Colors.grey,
                )),
            DrawerCard(
              image: MyLogos.expressNewsLogo,
              title: "Express Live",
              onTap: () {},
            ),
            DrawerCard(
              image: MyLogos.geoNewsLogo,
              title: "Geo Live",
              onTap: () {},
            ),
            DrawerCard(
              image: MyLogos.bolNewsLogo,
              title: "Bol Live",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
