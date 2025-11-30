import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardPaymentCheckOut extends StatelessWidget {
  const CardPaymentCheckOut({
    super.key,
    required this.title,
    required this.isActive,
  });
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),

          decoration: BoxDecoration(
        color: isActive == true ? AppColor.primaryColor : AppColor.thirdColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: TextStyle(
          height: 1.2,
          color: isActive == true ? Colors.white : AppColor.secondColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
