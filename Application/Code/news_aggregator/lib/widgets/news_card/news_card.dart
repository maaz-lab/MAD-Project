import 'package:flutter/material.dart';
import '../../models/news/news_model.dart';
import '../../resources/constants/style.dart';
import '../loading_image/loading_network_image.dart';

class NewsCard extends StatelessWidget {
  final NewsModel? news;
  final Function()? onTap;

  const NewsCard({super.key, this.news, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(Style.padding),
              child: Column(
                children: [
                  Text(
                    news?.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Style.title.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Style.space10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (news?.featuredImg != null) ...[
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: LoadingNetworkImage(
                            image: news?.featuredImg,
                            boxfit: BoxFit.cover,
                          ),
                        ),
                        Style.gap10,
                      ],
                      Expanded(
                        child: Text(
                          news?.description ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: Style.body,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
