import 'package:ecommerce_cource/controller/onboarding_controller.dart';
import 'package:ecommerce_cource/view/widget/onboarding/custom_button.dart';
import 'package:ecommerce_cource/view/widget/onboarding/dot_controller.dart';
import 'package:ecommerce_cource/view/widget/onboarding/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 3, child: pageviewbuilder()),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  dotController(),
                  const Spacer(flex: 2),
                  const Custom_button(),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
