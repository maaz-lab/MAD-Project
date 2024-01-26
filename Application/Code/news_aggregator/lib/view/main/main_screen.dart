import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/news/news_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/buttons/my_tab_button.dart';
import '../../widgets/drawer/my_drawer.dart';
import '../search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          drawer: MyDrawer(
            scaffoldKey: scaffoldKey,
          ),
          appBar: MyAppBar(
              height: kToolbarHeight + 40,
              title: "News Time",
              onTapDrawer: () => scaffoldKey.currentState?.openDrawer(),
              onTapAction: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchScreen())),
              bottom: Consumer<NewsViewModel>(
                builder: (context, value, child) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            value.newsTabs.length,
                            (index) => Row(
                                  children: [
                                    if (index == 0)
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    MyTabButton(
                                        title: value.newsTabs[index],
                                        index: index,
                                        selectedIndex: value.currentIndex,
                                        onChanged: (newIndex) {
                                          value.updateIndex(newIndex!);
                                          value.pageController.animateToPage(newIndex,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.linear);
                                        }),
                                  ],
                                ))
                      ],
                    ),
                  );
                },
              )),
          body: Consumer<NewsViewModel>(
            builder: (context, value, child) {
              return PageView(
                controller: value.pageController,
                onPageChanged: (index) => value.updateIndex(index),
                children: value.screens,
              );
            },
          )),
    );
  }
}
