import 'package:flutter/material.dart';
import '../../models/news/news_model.dart';
import '../../resources/constants/style.dart';
import '../loading_image/loading_network_image.dart';

class HomeNewsCard extends StatelessWidget {
  final NewsModel? news;
  final Function()? onTap;

  const HomeNewsCard({super.key, this.news, this.onTap});

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news?.featuredImg != null) ...[
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: SizedBox(
                  height: 200,
                  child: LoadingNetworkImage(
                    image: news?.featuredImg,
                    height: 200,
                    width: double.infinity,
                    boxfit: BoxFit.cover,
                  ),
                )),],
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
                  Text(
                    news?.description ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: Style.body,
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
