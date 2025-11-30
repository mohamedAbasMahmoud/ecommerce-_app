import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FogetPasswordController extends GetxController {
  checkEmail();
  goToveryFyCode();
}

class FogetPasswordControllerImp extends FogetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  checkEmail() {
     var formData = formKey.currentState;
    if (formData!.validate()) {
      print("valid");
    } else {
      print("Not Valid");
    }

  }

  @override
  goToveryFyCode() {
    Get.offNamed(AppRoutes.verfayCode);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
