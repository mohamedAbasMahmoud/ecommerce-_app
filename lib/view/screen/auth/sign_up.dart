import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/functions/alert_exit_app.dart';
import 'package:ecommerce_cource/core/functions/valid_input.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_body.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_title.dart';
import 'package:ecommerce_cource/controller/signUpController.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_bottun.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_text_form_feiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '17'.tr,

          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: PopScope(
        canPop: false, // عشان نتحكم بالخروج يدويًا
        onPopInvoked: (didPop) {
          if (!didPop) {
            alertExitApp(); // تستدعي الدالة هنا
          }
        },

        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => controller.signUp == StatusRequest.loading
              ? Center(child: CircularProgressIndicator(color: Colors.amber))
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: Form(
                    key: controller.formKey,
                    child: ListView(
                      children: [
                        const SizedBox(height: 20),
                        customTitle(title: '10'.tr),
                        const SizedBox(height: 15),
                        CustomTextBody(text: '24'.tr),
                        const SizedBox(height: 55),
                        CustomTextFormFieled(
                          isNumber: false,
                          valid: (value) {
                            return validInput(value!, 4, 30, "userName");
                          },

                          hitnText: '23'.tr,
                          labelText: '20'.tr,
                          sufIcon: Icon(Icons.person_2_outlined),
                          myController: controller.userName,
                        ),
                        const SizedBox(height: 15),

                        CustomTextFormFieled(
                          isNumber: false,
                          valid: (value) {
                            return validInput(value!, 6, 30, "email");
                          },
                          hitnText: '12'.tr,
                          labelText: '18'.tr,
                          sufIcon: Icon(Icons.email_outlined),
                          myController: controller.email,
                        ),
                        const SizedBox(height: 15),

                        CustomTextFormFieled(
                          isNumber: true,
                          valid: (value) {
                            return validInput(value!, 11, 20, "phone");
                          },
                          hitnText: '22'.tr,
                          labelText: '21'.tr,
                          sufIcon: Icon(Icons.phone_android_outlined),
                          myController: controller.phone,
                        ),
                        const SizedBox(height: 15),

                        CustomTextFormFieled(
                          isNumber: false,
                          valid: (value) {
                            return validInput(value!, 4, 30, "userName");
                          },
                          hitnText: '13'.tr,
                          labelText: '19'.tr,
                          sufIcon: Icon(Icons.visibility),
                          myController: controller.password,
                        ),
                        const SizedBox(height: 45),
                        CustomBottun(
                          title: '17'.tr,
                          color: AppColor.primaryColor,
                          onTap: () {
                            controller.signUp();
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('16'.tr, style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 15),

                            GestureDetector(
                              onTap: () {
                                controller.goToSignIn();
                              },
                              child: Text(
                                '9'.tr,
                                style: TextStyle(color: AppColor.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
