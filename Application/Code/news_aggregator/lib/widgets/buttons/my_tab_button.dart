import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/constants/style.dart';
import '../../theme/theme_provider.dart';

class MyTabButton extends StatelessWidget {
  final String title;
  final int index, selectedIndex;
  final ValueChanged<int?> onChanged;

  const MyTabButton(
      {super.key,
      required this.title,
      required this.index,
      required this.selectedIndex,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          border: Border.all(color: Style.darkColor),
          borderRadius: BorderRadius.circular(20),
          color: selectedIndex == index
              ? isDark
                  ? Style.lightColor
                  : Style.darkColor
              : isDark
                  ? Style.darkColor
                  : null),
      child: InkWell(
        onTap: () {
          if (selectedIndex != index) {
            onChanged(index);
          } else {
            onChanged(null);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            title,
            style: Style.title.copyWith(
                fontWeight: FontWeight.normal,
                color: selectedIndex == index
                    ? isDark
                        ? Style.darkColor
                        : Colors.white
                    : isDark
                        ? Style.lightColor
                        : Style.darkColor),
          ),
        ),
      ),
    );
  }
}
