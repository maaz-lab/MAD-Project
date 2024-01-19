import 'package:flutter/material.dart';
import '../../resources/constants/style.dart';
import '../../resources/data/my_data.dart';
import '../../widgets/buttons/my_elevated_button.dart';
import '../../widgets/news_card/news_card.dart';
import '../news_detail/news_detail_screen.dart';

class NewsScreen extends StatelessWidget {
  final String title, logo;

  const NewsScreen({super.key, required this.title, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Style.padding),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Latest News",
                  style: Style.heading
                      .copyWith(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                Column(
                  children: [
                    Image.asset(logo),
                    Style.space10,
                    SizedBox(
                        width: 150,
                        child: MyElevatedButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            bgColor: Colors.red,
                            title: "Subscribe",
                            onTap: () {}))
                  ],
                )
              ],
            ),
            Style.space10,
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: List.generate(
                    MyData.newsList.length,
                    (index) => NewsCard(
                          thumbnail: MyData.newsList[index].thumbnailImage,
                          title: MyData.newsList[index].title,
                          description: MyData.newsList[index].description,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsDetailScreen(
                                      newsLogo: logo,
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
