import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/responses/status.dart';
import '../../resources/constants/style.dart';
import '../../view_models/news/news_view_model.dart';
import '../../widgets/home_news_card/home_news_card.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';
import '../news_detail/news_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  void initState() {
    newsViewModel.getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Style.padding).copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Latest News",
              style: Style.heading,
            ),
            Style.space10,
            Expanded(
              child: SingleChildScrollView(
                child: ChangeNotifierProvider<NewsViewModel>(
                    create: (context) => newsViewModel,
                    builder: (context, snapshot) {
                      return Consumer<NewsViewModel>(
                        builder: (context, value, child) {
                          switch (value.allNewsList.status) {
                            case Status.ERROR:
                              debugPrint(value.allNewsList.message);
                              return Container();

                            case Status.COMPLETED:
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: value.allNewsList.data?.length,
                                itemBuilder: (context, index) {
                                  final news = value.allNewsList.data?[index];

                                  return HomeNewsCard(
                                    news: news,
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewsDetailScreen(
                                                  news: news,
                                                ))),
                                  );
                                },
                              );

                            default:
                              return const MyLoadingIndicator();
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
