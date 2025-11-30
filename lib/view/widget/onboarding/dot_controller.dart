import 'package:ecommerce_cource/controller/onboarding_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class dotController extends StatelessWidget {
  const dotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //spread operator

          //هو دالة تُستخدم لتوليد قائمة (List) بشكل ديناميكي بناءً على عدد معيّن، وتكرار عنصر معين مع تغيير داخله
          ...List.generate(
            ////listداخل list
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: EdgeInsets.only(right: 8),
              duration: Duration(milliseconds: 70),
              width: controller.currentPage == index ? 20 : 5,
              height: 8,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
