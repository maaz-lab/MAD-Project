import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/responses/status.dart';
import '../../resources/constants/style.dart';
import '../../view_models/news/news_view_model.dart';
import '../../widgets/buttons/my_elevated_button.dart';
import '../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../widgets/news_card/news_card.dart';
import '../news_detail/news_detail_screen.dart';

class NewsScreen extends StatefulWidget {
  final String title, logo;
  final bool isExpress, isGeo, isBol;

  const NewsScreen({
    super.key,
    this.isExpress = false,
    this.isGeo = false,
    this.isBol = false,
    required this.title,
    required this.logo,
  });

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
        padding: EdgeInsets.all(Style.padding).copyWith(bottom: 0),
        child: Column(children: [
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
                  SizedBox(
                      height: 40, width: 80, child: Image.asset(widget.logo)),
                  Style.space10,
                  Consumer<NewsViewModel>(
                    builder: (context, value, child) {
                      return SizedBox(
                          height: 30,
                          width: 100,
                          child: MyElevatedButton(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 2),
                              bgColor: Colors.red,
                              title: value.getSubscribeText(
                                isExpress: widget.isExpress,
                                isGeo: widget.isGeo,
                                isBol: widget.isBol,
                              ),
                              onTap: () {
                                value.setSubscribe(
                                  isExpress: widget.isExpress,
                                  isGeo: widget.isGeo,
                                  isBol: widget.isBol,
                                );
                              }));
                    },
                  ),
                ],
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
                              itemCount: widget.isExpress
                                  ? value.expressNewsList.data?.length
                                  : widget.isGeo
                                      ? value.geoNewsList.data?.length
                                      : value.bolNewsList.data?.length,
                              itemBuilder: (context, index) {
                                final news = widget.isExpress
                                    ? value.expressNewsList.data![index]
                                    : widget.isGeo
                                        ? value.geoNewsList.data![index]
                                        : value.bolNewsList.data![index];

                                return NewsCard(
                                  news: news,
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NewsDetailScreen(
                                                news: news,
                                                newsLogo: widget.logo,
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
        ]),
      ),
    );
  }
}
