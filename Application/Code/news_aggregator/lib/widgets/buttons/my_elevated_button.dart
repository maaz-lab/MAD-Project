import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Color? bgColor;
  final Function()? onTap;

  const MyElevatedButton(
      {super.key,
      this.bgColor,
      this.isLoading = false,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                    onTap == null ? Colors.grey.shade300 : bgColor),
            child: Center(
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)))));
  }
}