import 'package:flutter/material.dart';
import '../../resources/constants/style.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int? index;
  final bool isCenter, isBorder;
  final Color backgroundColor;
  final String? title;
  final TextStyle? titleStyle;
  final Function()? onTapDrawer, onTapAction;
  final Widget? bottom;

  const MyAppBar({
    super.key,
    this.isBorder = true,
    this.isCenter = true,
    this.index,
    this.backgroundColor = Colors.white,
    this.title,
    this.titleStyle,
    this.bottom,
    this.onTapAction,
    this.onTapDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: isCenter,
        leading: onTapDrawer != null
            ? IconButton(
                onPressed: onTapDrawer,
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ))
            : null,
        actions: onTapAction != null
            ? [
                IconButton(
                    onPressed: onTapAction,
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black,
                    )),
              ]
            : null,
        bottom: bottom != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: bottom!,
              )
            : null,
        title: title != null
            ? Text(title!,
                style: titleStyle ??
                    Style.title.copyWith(
                      fontSize: 28,
                    ))
            : null);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
