import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:get/get.dart';

handlingdata(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
