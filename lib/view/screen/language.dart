import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/localization/localizationController.dart';
import 'package:ecommerce_cource/view/widget/langauge/custom_button_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<Localizationcontroller> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1'.tr,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            SizedBox(height: 8),

            CustomButton(
              textButton: 'Arabic',
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            CustomButton(
              textButton: 'English',
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
