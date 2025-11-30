import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class VeryFyCodeController extends GetxController {
  
  checkEmail();
  goToResetCode();

}

class VeryFyCodeSignUpControllerImp extends VeryFyCodeController {
  late String veryvfCode;
  @override
  checkEmail() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  goToResetCode() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
