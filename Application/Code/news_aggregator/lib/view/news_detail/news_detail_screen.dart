import 'package:flutter/material.dart';
import '../../models/news/news_model.dart';
import '../../resources/constants/style.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/loading_image/loading_network_image.dart';

class NewsDetailScreen extends StatelessWidget {
  final String? newsLogo;
  final NewsModel? news;

  const NewsDetailScreen({
    super.key,
    this.newsLogo,
    this.news,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          image: newsLogo,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Style.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (news?.featuredImg != null) ...[
                  LoadingNetworkImage(
                    image: news?.featuredImg,
                  ),
                ],
                if (news?.time != null) ...[
                  Style.space10,
                  Text(
                    "Time: ${news?.time}",
                    style: Style.heading.copyWith(
                        color: Colors.redAccent, fontWeight: FontWeight.w600),
                  ),
                ],
                Style.space10,
                Text(
                  news?.title ?? "",
                  style: Style.heading.copyWith(fontWeight: FontWeight.w600),
                ),
                Style.space10,
                Text(
                  news?.description ?? "",
                  style: Style.title,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
