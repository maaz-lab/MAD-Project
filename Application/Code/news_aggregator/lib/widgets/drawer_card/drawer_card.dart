import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/constants/style.dart';
import '../../theme/theme_provider.dart';

class DrawerCard extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String? title, subTitle, image;
  final bool isToggle;
  final Function()? onTap;

  const DrawerCard({
    super.key,
    this.icon,
    this.iconColor,
    this.title,
    this.subTitle,
    this.image,
    this.isToggle = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(Style.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              if (image != null) ...[
                SizedBox(height: 40, width: 40, child: Image.asset(image!))
              ] else ...[
                Icon(
                  icon,
                  color: iconColor,
                  size: 40,
                ),
              ],
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
            if (isToggle) ...[
              IgnorePointer(
                child: Switch(
                    activeColor: Colors.white,
                    value: isDark,
                    onChanged: (value) {
                      isDark = value;
                    }),
              )
            ] else ...[
              const Icon(Icons.arrow_forward_ios)
            ]
          ],
        ),
      ),
    );
  }
}
