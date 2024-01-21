import 'package:flutter/material.dart';
import '../../resources/constants/style.dart';
import '../../resources/data/my_data.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/home_news_card/home_news_card.dart';
import '../../widgets/search/my_search_bar.dart';
import '../news_detail/news_detail_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          height: 100,
          bottom: MySearchBar(
              hint: "Search news",
              controller: searchController,
              onChanged: (value) {}),
        ),
        body: Padding(
          padding: EdgeInsets.all(Style.padding),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: List.generate(
                      MyData.newsList.length,
                      (index) => HomeNewsCard(
                            thumbnail: MyData.newsList[index].thumbnailImage,
                            title: MyData.newsList[index].title,
                            description: MyData.newsList[index].description,
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDetailScreen(
                                        image: MyData
                                            .newsList[index].thumbnailImage!,
                                        title: MyData.newsList[index].title!,
                                        description: MyData
                                            .newsList[index].description!))),
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
