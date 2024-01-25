import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/responses/status.dart';
import '../../resources/constants/style.dart';
import '../../view_models/news/news_view_model.dart';
import '../../widgets/home_news_card/home_news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  void initState() {
    newsViewModel.getExpressNews();
    newsViewModel.getGeoNews();
    newsViewModel.getBolNews();
    super.initState();
  }

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
              child: SingleChildScrollView(
                child: ChangeNotifierProvider<NewsViewModel>(
                    create: (context) => newsViewModel,
                    builder: (context, snapshot) {
                      return Consumer<NewsViewModel>(
                        builder: (context, value, child) {
                          switch (value.expressNewsList.status) {
                            case Status.ERROR:
                              debugPrint(value.expressNewsList.message);
                              return Container();

                            case Status.COMPLETED:
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: value.expressNewsList.data!.length,
                                itemBuilder: (context, index) {
                                  final news =
                                      value.expressNewsList.data![index];

                                  return HomeNewsCard(
                                    title: news.title,
                                    description: news.description,
                                    thumbnail: news.featuredImg,
                                  );
                                },
                              );

                            default:
                              return const CircularProgressIndicator();
                          }
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
