import 'package:flutter/material.dart';
import '../../resources/constants/style.dart';
import '../../resources/data/my_data.dart';
import '../../widgets/home_news_card/home_news_card.dart';
import '../news_detail/news_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Style.padding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Favourite",
                  style: Style.heading,
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                )
              ],
            ),
            Style.space10,
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
    );
  }
}
