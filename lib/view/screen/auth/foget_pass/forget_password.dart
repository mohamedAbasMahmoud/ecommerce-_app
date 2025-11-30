import 'package:ecommerce_cource/controller/forget_password.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/constant/imageasset.dart';
import 'package:ecommerce_cource/core/functions/valid_input.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_body.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_title.dart';
import 'package:ecommerce_cource/controller/login_controller.dart';
import 'package:ecommerce_cource/view/screen/auth/logo.dart';
import 'package:ecommerce_cource/controller/signUpController.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_bottun.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_text_form_feiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    FogetPasswordControllerImp controller = Get.put(
      FogetPasswordControllerImp(),
    );
    return Scaffold(
      backgroundColor: AppColors,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '14'.tr,

          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              customTitle(title: '27'.tr),
              const SizedBox(height: 40),
              CustomTextBody(text: '29'.tr),
              const SizedBox(height: 30),

              CustomTextFormFieled(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 6, 20, "email");
                },
                hitnText: '12'.tr,
                labelText: '18'.tr,
                sufIcon: Icon(Icons.email_outlined),
                myController: controller.email,
              ),
              const SizedBox(height: 45),

              CustomBottun(
                onTap: () {
                  controller.checkEmail();

                  controller.goToveryFyCode();
                },
                title: 'Check',
                color: AppColor.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
