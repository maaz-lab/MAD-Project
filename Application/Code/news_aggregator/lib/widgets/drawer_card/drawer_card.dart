import 'package:flutter/material.dart';
import 'package:news_aggregator/resources/constants/style.dart';

class DrawerCard extends StatelessWidget {
  final IconData? icon;
  final String? title, subTitle;
  final Function()? onTap;

  const DrawerCard(
      {super.key, this.icon, this.title, this.subTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(Style.padding),
        child: Row(children: [
          Icon(
            icon,
            size: 40,
          ),
          Style.gap10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                Text(
                  title!,
                  style: Style.title,
                ),
              ],
              if (subTitle != null) ...[
                const SizedBox(
                  height: 2,
                ),
                Text(
                  subTitle!,
                  style: Style.body.copyWith(color: Colors.grey.shade700),
                )
              ]
            ],
          )
        ]),
      ),
    );
  }
}
