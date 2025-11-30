import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieled extends StatelessWidget {
  const CustomTextFormFieled({
    super.key,
    required this.hitnText,
    required this.labelText,
    required this.sufIcon,
    required this.myController,
    required this.valid,
    required this.isNumber,
    this.obscureText = false,
  });
  final String hitnText;
  final String labelText;
  final Widget sufIcon;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,

      keyboardType: isNumber
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: valid,
      controller: myController,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hitnText,
        hintStyle: TextStyle(fontSize: 14),
        suffixIcon: sufIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // borderSide: BorderSide(color: Colors.lightBlueAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColor.primaryColor),
        ),
        //         focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide(color: AppColor.primaryColor),
        // ),
      ),
    );
  }
}
