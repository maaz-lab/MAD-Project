import 'package:flutter/material.dart';
import '../../resources/constants/images.dart';
import '../../resources/constants/style.dart';

class NewsCard extends StatelessWidget {
  final String? title, description, thumbnail;
  final Function()? onTap;

  const NewsCard(
      {super.key, this.title, this.description, this.thumbnail, this.onTap});

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
                    title ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Style.title.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Style.space10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        thumbnail ?? MyImages.noImage,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Style.gap10,
                      Expanded(
                        child: Text(
                          description ?? "",
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
