import 'package:flutter/material.dart';

import '../../resources/constants/style.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class NewsDetailScreen extends StatelessWidget {
  final String image, title, description;
  final String? newsLogo;

  const NewsDetailScreen(
      {super.key,
      this.newsLogo,
      required this.image,
      required this.title,
      required this.description});

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
              children: [
                Image.asset(image),
                Style.space10,
                Text(
                  title,
                  style: Style.heading.copyWith(fontWeight: FontWeight.w600),
                ),
                Style.space10,
                Text(
                  description,
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
