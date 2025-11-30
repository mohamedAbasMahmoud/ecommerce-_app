import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class UnderAppbarCart extends StatelessWidget {
  final String title;
  const UnderAppbarCart({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      margin: EdgeInsets.symmetric(horizontal: 20),

      decoration: BoxDecoration(
        color: AppColor.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
