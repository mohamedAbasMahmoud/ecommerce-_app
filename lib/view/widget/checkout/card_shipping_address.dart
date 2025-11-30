import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CartShippingAddress extends StatelessWidget {
  const CartShippingAddress({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isActive,
  });
  final String title;
  final String subTitle;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive == true ? AppColor.primaryColor : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 19,
            color: isActive == true ? Colors.white : null,
          ),
        ),
        subtitle: Text(subTitle),
      ),
    );
  }
}
