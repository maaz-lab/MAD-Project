import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int? index;
  final bool isCenter, isBorder;
  final Color backgroundColor;
  final String? title;

  const MyAppBar({
    super.key,
    this.isBorder = true,
    this.isCenter = true,
    this.index,
    this.backgroundColor = Colors.white,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: isCenter,
        title: title != null
            ? Text(title!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600))
            : null);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
