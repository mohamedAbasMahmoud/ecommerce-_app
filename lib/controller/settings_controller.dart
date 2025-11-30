import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    myServices.sharedPreferences.clear();

    Get.offAllNamed(AppRoutes.login); 
  }
}
