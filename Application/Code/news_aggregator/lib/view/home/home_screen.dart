import 'package:flutter/material.dart';
import 'package:news_aggregator/resources/data/my_data.dart';
import 'package:news_aggregator/widgets/home_news_card/home_news_card.dart';
import '../../resources/constants/style.dart';

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
                  "Trends",
                  style: Style.heading,
                ),
                const Icon(
                  Icons.account_circle_rounded,
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
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
