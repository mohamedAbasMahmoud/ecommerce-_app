import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.textButton, this.onPressed});
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 128),
      width: double.infinity,

      child: MaterialButton(
        shape: BoxBorder.all(color: Colors.grey),
        onPressed: onPressed,

        //color: Colors.blue,
        color: AppColor.primaryColor,
        child: Text(
          textButton,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        textColor: Colors.white,
      ),
    );
  }
}
