import 'package:ecommerce_cource/controller/product_details_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';

class SubItemsListColors extends StatelessWidget {
  const SubItemsListColors({
    super.key,
    required this.controller,
  });

  final ProductControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 12),
    
            alignment: Alignment.center,
            height: 50,
            width: 70,
            decoration: BoxDecoration(
              color: controller.subitems[index]['active'] == '1'
                  ? AppColor.fourthColor
                  : Colors.white,
              border: Border.all(color: AppColor.fourthColor),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              controller.subitems[index]['name'],
              style: TextStyle(
                color: controller.subitems[index]['active'] == '1'
                    ? Colors.white
                    : AppColor.fourthColor,
              ),
            ),
          ),
        ),
 
      ],
    );
  }
}