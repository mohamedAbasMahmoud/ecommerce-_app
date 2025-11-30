import 'package:ecommerce_cource/controller/forget_password.dart';
import 'package:ecommerce_cource/controller/reset_password.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/constant/imageasset.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_body.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_title.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_bottun.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_text_form_feiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(
      ResetPasswordControllerImp(),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '44'.tr,

          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            customTitle(title: '35'.tr),
            const SizedBox(height: 40),
            CustomTextBody(text: '34'.tr),
            const SizedBox(height: 30),

            CustomBottun(
              title: '33'.tr,
              color: AppColor.primaryColor,
              onTap: () {
                controller.goToSuccessResetPassowrd();
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
