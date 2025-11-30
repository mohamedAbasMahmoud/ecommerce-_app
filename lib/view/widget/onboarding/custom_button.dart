import 'package:ecommerce_cource/controller/onboarding_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

//يجهز لك controller تلقائيًا بدون ما تكتبه بإيدك
class Custom_button extends GetView<OnboardingControllerImp> {
  const Custom_button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 280,

      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        onPressed: () {
          controller.continuo();
        },
        child: Text("8".tr, style: TextStyle(fontSize: 18)),
        textColor: Colors.white,

        color: AppColor.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
