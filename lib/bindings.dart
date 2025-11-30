import 'package:ecommerce_cource/controller/signUpController.dart';
import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.put(Crud());
    
  }
}
