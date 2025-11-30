import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/data/datasource/remote/home/home_data.dart';
import 'package:ecommerce_cource/data/models/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMixController extends GetxController {
  late StatusRequest statusRequest;
  HomeDate homeData = HomeDate(Get.find());

  List<ItemsModel> listSearchData = [];
  TextEditingController? search;
  bool isSearch = false;

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
      update();
    }
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await homeData.searhData(search!.text);
    statusRequest = handlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listSearchData.clear();
        List responseData = response['data'];
        listSearchData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToProductDetails(itemsModel) {
    Get.toNamed(
      AppRoutes.productDetails,
      arguments: {"itemsModel": itemsModel},
    );
  }
}
