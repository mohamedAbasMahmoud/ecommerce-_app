import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  continuo() {}
  onPageChanged(int index) {}
}

class OnboardingControllerImp extends OnboardingController {
  PageController pageController = PageController();

  int currentPage = 0;
  MyServices myServices = Get.find();
  @override
  continuo() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 900),
        curve: Curves.ease,
      );
    }
    return super.continuo();
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  // @override
  // void onInit() {
  //   pageController = PageController();
  //   super.onInit();
  // }
}
