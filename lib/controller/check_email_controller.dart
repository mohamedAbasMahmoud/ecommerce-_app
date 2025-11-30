import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToVerfyCode();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;

  @override
  checkEmail() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  goToVerfyCode() {
    Get.offNamed(AppRoutes.veryfiyCodeSignUp);
  }

  @override
  void onInit() {
    email = TextEditingController();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    // TODO: implement dispose
    super.dispose();
  }
}
