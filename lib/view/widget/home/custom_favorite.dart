import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomHomeTitle extends StatelessWidget {
  const CustomHomeTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
