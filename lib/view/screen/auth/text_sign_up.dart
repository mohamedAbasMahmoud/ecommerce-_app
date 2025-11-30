import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class TextSignUp extends StatelessWidget {
  const TextSignUp({
    super.key,
    required this.textOne,
    required this.textTwo,
    this.onTap,
  });
  final String textOne;
  final String textTwo;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne, style: TextStyle(color: Colors.black)),
        SizedBox(height: 15),

        GestureDetector(
          onTap: onTap,
          child: Text(
            textTwo,
            style: TextStyle(color: AppColor.primaryColor, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
