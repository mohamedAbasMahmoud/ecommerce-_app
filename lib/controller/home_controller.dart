import 'package:ecommerce_cource/controller/search_controller.dart';
import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/home/home_data.dart';
import 'package:ecommerce_cource/data/models/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getData();
  goItems(List categories, int selectedCategory, String categoryid);
  String? lang;
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  HomeDate homeData = HomeDate(Get.find());

  String? username;
  String? id;
  String deliveryTime = "";
  //--------
  List items = [];
  List categories = [];
  List settingsData = [];
  late StatusRequest statusRequest;
  //--
  //////////////////////////////////////////////////
  @override
  initialData() {
    username = myServices.sharedPreferences.getString("userName");
    id = myServices.sharedPreferences.getString("id");
    lang = myServices.sharedPreferences.getString("lang");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingdata(response);
    print("::::::::homeData::::::::$response");

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        settingsData.addAll(response["settings"]);
        deliveryTime = settingsData[0]["settings_deliverytime"];
        myServices.sharedPreferences.setString("deliveryTime", deliveryTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goItems(List categories, int selectedCategory, categoryid) {
    Get.toNamed(
      AppRoutes.items,
      arguments: {
        "categories": categories,
        "selectedCategory": selectedCategory,
        "categoryid": categoryid,
      },
    );
  }
}
