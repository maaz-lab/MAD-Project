import 'package:flutter/material.dart';

class Style {
  // Color
  static const Color drawerColor = Color(0xffE9E2E2);
  static const Color darkColor = Color(0xff222831);
  static const Color lightColor = Color(0xffAFAFAF);

  // Padding
  static double padding = 16;

  // Space
  static Widget space = SizedBox(
    height: padding,
  );

  static Widget space10 = const SizedBox(
    height: 10,
  );

  static Widget space20 = const SizedBox(
    height: 20,
  );

  static Widget space40 = const SizedBox(
    height: 40,
  );

  static Widget gap = SizedBox(
    width: padding,
  );

  static Widget gap10 = const SizedBox(
    width: 10,
  );

  // Text Styles
  static TextStyle tag =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w400);

  static TextStyle heading =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  static TextStyle title =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle body =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
}
