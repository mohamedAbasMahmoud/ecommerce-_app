import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//to skip lang and onboard after see all onboarding
class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1; //الاهم
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    //one seen
    if (myServices.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: AppRoutes.mainScreen);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRoutes.login);
    } 
  }
}
