import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  bool isVisibilty = false;
  StatusRequest? statusRequest;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void visibility() {
    isVisibilty = !isVisibilty;
    update();
  }

  @override
  login() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      var statusRequest = StatusRequest.loading;
      update();
      //لان الايميل والباسورد من نوع تيكست ادتنج كنترول
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingdata(response);
      print('================LOGIN===============$response');

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //تخزين بيانات اليوزر بعد اللوجن
          myServices.sharedPreferences.setString(
            "id",
            response["data"]["users_id"],
          );
          myServices.sharedPreferences.setString(
            "userName",
            response["data"]["users_name"],
          );
          myServices.sharedPreferences.setString(
            "email",
            response["data"]["users_email"],
          );
          myServices.sharedPreferences.setString(
            "phone",
            response["data"]["users_phone"],
          );
          myServices.sharedPreferences.setString(
            "step",
            "2",
          ); //onbording=1=>login,-2=>home

          Get.toNamed(AppRoutes.mainScreen);
        } else {
          Get.defaultDialog(
            title: "ُWarning",
            middleText: "email or password not correct",
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
    // var formData = formKey.currentState;
    // if (formData!.validate()) {
    //   Get.offNamed(AppRoutes.signUp);
    // } else {
    //   print("Not Valid");
    // }
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    //تُستدعى مرة واحدة فقط عند إنشاء ال كنترولر  لأول مرةلتهيئه البيانات
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });

    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
