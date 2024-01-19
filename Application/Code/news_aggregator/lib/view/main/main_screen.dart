import 'package:flutter/material.dart';
import 'package:news_aggregator/view/home/home_screen.dart';
import '../../resources/data/my_data.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/buttons/my_tab_button.dart';
import '../../widgets/drawer/my_drawer.dart';
import '../news/news_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final PageController pageController = PageController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(
        scaffoldKey: scaffoldKey,
      ),
      appBar: MyAppBar(
        title: "News Time",
        onTapDrawer: () => scaffoldKey.currentState?.openDrawer(),
        onTapAction: () {},
        bottom: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                  MyData.tabs.length,
                  (index) => Row(
                        children: [
                          if (index == 0)
                            const SizedBox(
                              width: 10,
                            ),
                          MyTabButton(
                              title: MyData.tabs[index],
                              index: index,
                              selectedIndex: currentIndex,
                              onChanged: (value) {
                                setState(() {
                                  currentIndex = index;
                                  pageController.animateToPage(value!,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                });
                              }),
                        ],
                      ))
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: const [
          HomeScreen(),
          NewsScreen(title: "Geo News"),
          NewsScreen(title: "Ary News"),
          NewsScreen(title: "Samaa News"),
        ],
      ),
    );
  }
}
