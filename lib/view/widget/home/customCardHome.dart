import 'package:ecommerce_cource/controller/home_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customCardHome extends GetView<HomeControllerImp> {
  const customCardHome({super.key, required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                body,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            height: 150,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            top: -10,

            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(160),

                color: AppColor.secondColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
