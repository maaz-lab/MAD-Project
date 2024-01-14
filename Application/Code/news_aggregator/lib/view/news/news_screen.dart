import 'package:flutter/material.dart';
import 'package:news_aggregator/widgets/app_bar/my_app_bar.dart';

class NewsScreen extends StatelessWidget {
  final String title;

  const NewsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
        isCenter: false,
      ),
    );
  }
}
