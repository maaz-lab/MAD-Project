import 'package:flutter/material.dart';
import 'package:news_aggregator/models/news/news_model.dart';
import 'package:provider/provider.dart';
import '../../data/responses/status.dart';
import '../../resources/constants/style.dart';
import '../../view_models/news/news_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../widgets/news_card/news_card.dart';
import '../../widgets/search/my_search_bar.dart';
import '../news_detail/news_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  NewsViewModel newsViewModel = NewsViewModel();

  @override
  void initState() {
    newsViewModel.getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
            height: 100,
            bottom: Consumer<NewsViewModel>(
              builder: (context, value, child) {
                return MySearchBar(
                    hint: "Search news",
                    controller: searchController,
                    sufixIcon: Icons.close,
                    onTapSufix: () {
                      searchController.clear();
                      setState(() {});
                    },
                    onChanged: (query) {
                      value.searchNews(query);
                      setState(() {});
                    });
              },
            )),
        body: Padding(
          padding: EdgeInsets.all(Style.padding),
          child: Column(
            children: [
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
                                if (searchController.text.isNotEmpty) {
                                  List<NewsModel> searchResults =
                                      value.searchNews(searchController.text);

                                  return buildNewsList(searchResults);
                                } else {
                                  return buildNewsList(
                                      value.allNewsList.data ?? []);
                                }

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
      ),
    );
  }

  Widget buildNewsList(List<NewsModel> newsList) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];

        return NewsCard(
          news: news,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailScreen(
                news: news,
              ),
            ),
          ),
        );
      },
    );
  }
}
