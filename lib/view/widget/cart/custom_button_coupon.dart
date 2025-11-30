import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCoupon({Key? key, required this.textbutton, this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
