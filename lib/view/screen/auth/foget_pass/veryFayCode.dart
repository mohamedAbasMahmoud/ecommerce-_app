import 'package:ecommerce_cource/controller/forget_password.dart';
import 'package:ecommerce_cource/controller/veryfyCode_contrller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/constant/imageasset.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_body.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VeryFiyCode extends StatelessWidget {
  const VeryFiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VeryFyCodeSignUpControllerImp controller = Get.put(
      VeryFyCodeSignUpControllerImp(),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '39'.tr,

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
            customTitle(title: '40'.tr),
            const SizedBox(height: 40),
            CustomTextBody(text: '41'.tr),
            const SizedBox(height: 30),

            Directionality(
              textDirection: TextDirection.ltr,
              child: OtpTextField(
                cursorColor: AppColor.primaryColor,
                fieldWidth: 50,
      
                focusedBorderColor: AppColor.primaryColor,
                numberOfFields: 5,
                borderRadius: BorderRadius.circular(16),
                borderColor: AppColor.backgroundcolor,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.goToResetCode();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('39'.tr),
                        content: Text('42 $verificationCode'.tr),
                      );
                    },
                  );
                }, // end onSubmit
              ),
            ),
            const SizedBox(height: 45),
          ],
        ),
      ),
    );
  }
}
