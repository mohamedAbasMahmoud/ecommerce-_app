import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/functions/alert_exit_app.dart';
import 'package:ecommerce_cource/core/functions/valid_input.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_body.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_title.dart';
import 'package:ecommerce_cource/controller/login_controller.dart';
import 'package:ecommerce_cource/view/screen/auth/logo.dart';
import 'package:ecommerce_cource/view/screen/auth/text_sign_up.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_bottun.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_text_form_feiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '9'.tr,

          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<LoginControllerImp>(
        builder: (contrller) => contrller.statusRequest == StatusRequest.loading
            ? Center(child: CircularProgressIndicator(color: Colors.amber))
            : PopScope(
                canPop: false, // عشان نتحكم بالخروج يدويًا
                onPopInvoked: (didPop) {
                  if (!didPop) {
                    alertExitApp(); // تستدعي الدالة هنا
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: Form(
                    key: controller.formKey,
                    child: ListView(
                      children: [
                        const LogoAuth(),
                        const SizedBox(height: 20),
                        customTitle(title: '10'.tr),
                        const SizedBox(height: 15),
                        CustomTextBody(text: '11'.tr),
                        const SizedBox(height: 55),

                        CustomTextFormFieled(
                          isNumber: false,
                          valid: (value) {
                            return validInput(value!, 6, 100, "email");
                          },
                          hitnText: '12'.tr,
                          labelText: '18'.tr,
                          sufIcon: Icon(Icons.email_outlined),
                          myController: controller.email,
                        ),
                        const SizedBox(height: 35),

                        CustomTextFormFieled(
                          obscureText: controller.isVisibilty ? false : true,

                          isNumber: false,
                          valid: (value) {
                            return validInput(value!, 5, 30, "password");
                          },
                          hitnText: '13'.tr,
                          labelText: '19'.tr,
                          sufIcon: IconButton(
                            onPressed: () {
                              controller.visibility();
                            },
                            icon: controller.isVisibilty
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                          ),
                          myController: controller.password,
                        ),
                        const SizedBox(height: 15),

                        GestureDetector(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text('14'.tr, textAlign: TextAlign.right),
                        ),
                        const SizedBox(height: 15),

                        CustomBottun(
                          title: '15'.tr,
                          color: AppColor.primaryColor,
                          onTap: () {
                           // Get.toNamed(AppRoutes.homeScreen);
                             controller.login();
                          },
                        ),
                        SizedBox(height: 20),
                        TextSignUp(
                          textOne: '16'.tr,
                          textTwo: '17'.tr,
                          onTap: () {
                            controller.goToSignUp();
                          },
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
