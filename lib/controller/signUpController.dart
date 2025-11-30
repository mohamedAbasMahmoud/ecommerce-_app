import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/data/datasource/remote/auth/signUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController userName;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  SignUpData signUpController = SignUpData(Get.find());

  List data = [];

  @override
  signUp() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      var statusRequest = StatusRequest.loading;
      update();
      var response = await signUpController.postData(
        userName.text,
        password.text,
        phone.text,
        email.text,
      );
      statusRequest = handlingdata(response);
      print('=====================================$response');

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //data.addAll(response['data']);
          // Get.toNamed(AppRoutes.verfayCode);
        } else {
          Get.defaultDialog(
            title: "ُWarning",
            middleText: "Phone Number Or Email Already Exists",
          );

          statusRequest = StatusRequest.failure;
        }
      }
      update();
      //Get.toNamed(AppRoutes.verfayCode);
      //Get.delete<SignUpControllerImp>();
    } else {
      print("Not Valid");
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    userName.dispose();
    phone.dispose();

    // TODO: implement dispose
    super.dispose();
  }
}
