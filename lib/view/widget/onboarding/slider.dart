import 'package:ecommerce_cource/controller/onboarding_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

//slider-
class pageviewbuilder extends GetView<OnboardingControllerImp> {
  const pageviewbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      //رقم الصفحه
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          const SizedBox(height: 80),
          Image.asset(onBoardingList[index].image!, width: Get.width / 1.4),
          const SizedBox(height: 60),
          Text(
            onBoardingList[index].title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColor.black,
            ),
          ),
          const SizedBox(height: 30),

          Container(
            width: double.infinity,
            alignment: Alignment.center,

            child: Text(
              onBoardingList[index].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
