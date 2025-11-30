import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class DeliveryType extends StatelessWidget {
  const DeliveryType({
    super.key,
    required this.imageName,
    required this.title,
    required this.isActive,
  });
  final String imageName;
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: isActive == true ? AppColor.secondColor : null,
        border: Border.all(color: AppColor.secondColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageName, width: 90, height: 90),
          Text(title, style: TextStyle(color: AppColor.primaryColor)),
        ],
      ),
    );
  }
}
