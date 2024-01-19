import 'package:flutter/material.dart';
import 'package:news_aggregator/resources/constants/style.dart';
import 'package:news_aggregator/widgets/drawer_card/drawer_card.dart';

class MyDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const MyDrawer({super.key, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Style.drawerColor,
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
            DrawerCard(
              icon: Icons.account_circle,
              title: "DANIYAL NAWAZ",
              subTitle: "View profile",
              onTap: () {},
            ),
            DrawerCard(
              icon: Icons.dark_mode,
              title: "Dark Mode",
              onTap: () {},
            ),
            DrawerCard(
              icon: Icons.settings,
              title: "Settings",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
