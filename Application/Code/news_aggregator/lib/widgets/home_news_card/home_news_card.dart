import 'package:flutter/material.dart';
import '../../resources/constants/images.dart';
import '../../resources/constants/style.dart';

class HomeNewsCard extends StatelessWidget {
  final String? title, description, thumbnail;
  final Function()? onTap;

  const HomeNewsCard(
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  thumbnail ?? MyImages.noImage,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
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
                  Text(
                    description ?? "",
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
