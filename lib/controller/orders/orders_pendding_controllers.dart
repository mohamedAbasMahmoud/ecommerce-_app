import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/orders/delete_orders_data.dart';
import 'package:ecommerce_cource/data/datasource/remote/orders/waiting_pendding_data.dart';
import 'package:ecommerce_cource/data/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  WaitingPenddingData waitingPenddingData = WaitingPenddingData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  DeleteOrdersData deleteOrdersData = DeleteOrdersData(Get.find());
  List<OrdersModel> data = [];

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethode(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
  }

  String printStatusOrder(String val) {
    if (val == "0") {
      return "Waiting";
    } else if (val == "1") {
      return "Prepare";
    } else if (val == "2") {
      return "On The Way";
    } else {
      return "Archive ";
    }
  }

  getOrders() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await waitingPenddingData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("============getorders==========  $response");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      List responseData = response['data'];
      data.addAll(responseData.map((e) => OrdersModel.fromJson(e)));

      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  //deleteOrders-------

  deleteOrders(String ordersID) async {
    statusRequest = StatusRequest.loading;
    var response = await deleteOrdersData.deletaData(ordersID);
    print("=============================== Controller $response ");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        refrehOrder();
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

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
