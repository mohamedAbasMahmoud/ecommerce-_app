import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class VeryFyCodeControllerSignUp extends GetxController {
  checkEmail();
  goToSuccessSignUp();
}

class VeryFyCodeControllerSignUpImp extends VeryFyCodeControllerSignUp {
  late String veryvfCode;
  @override
  checkEmail() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
