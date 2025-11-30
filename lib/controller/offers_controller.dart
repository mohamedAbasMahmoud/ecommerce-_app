import 'package:ecommerce_cource/controller/search_controller.dart';
import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/data/datasource/remote/home/offers_data.dart';
import 'package:ecommerce_cource/data/datasource/remote/test_data.dart';
import 'package:ecommerce_cource/data/models/items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    statusRequest = handlingdata(response);
    print('=========OffersController===========$response');

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = (response['data']);
        data.addAll(dataList.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    // TODO: implement onInit
    super.onInit();
  }
}
