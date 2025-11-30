import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  CustomButtonAppBar({
    super.key,
    required this.onPressed,
    required this.textButton,
    required this.icon,

    required this.isActive,
  });
  final void Function()? onPressed;
  final String textButton;
  final IconData icon;

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? AppColor.primaryColor : Colors.grey[800],
          ),
          Text(
            textButton,
            style: TextStyle(
              color: isActive == true
                  ? AppColor.primaryColor
                  : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
