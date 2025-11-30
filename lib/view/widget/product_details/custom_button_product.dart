import 'package:ecommerce_cource/controller/product_details_controller.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomButtonProductDetails extends StatelessWidget {
  const CustomButtonProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductControllerImp productControllerImp = Get.put(ProductControllerImp());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 40,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: AppColor.fourthColor,
        onPressed: () {
          productControllerImp.cartController.refreshPage();
          Get.toNamed(AppRoutes.cart);
        },
        child: const Text(
          "Go To Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
