import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/orders/delete_orders_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrdersDelete extends GetxController {
  DeleteOrdersData deleteOrdersData = DeleteOrdersData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  deleteOrders(String ordersID) async {
    statusRequest = StatusRequest.loading;
    var response = await deleteOrdersData.deletaData(ordersID);
    print("=============================== Controller $response ");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "تم حزف الاوردر",
          messageText: Text("تم الحزف نهائي "),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
}
