import 'package:flutter/material.dart';
import '../../resources/constants/style.dart';

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
          color: selectedIndex == index ? Colors.black : Colors.white),
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
                color: selectedIndex == index ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
