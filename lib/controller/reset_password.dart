import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassowrd();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  //match 2 pass
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  resetPassword() {}

  @override
  goToSuccessResetPassowrd() {
    Get.toNamed(AppRoutes.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    // TODO: implement dispose
    super.dispose();
  }
}
