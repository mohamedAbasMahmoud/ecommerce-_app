import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/items/add_remove_favorite_data.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

////add remove ---------
class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  List data = [];

  Map isFavorite = {};

  //  key => id items
  //  Value => 1 OR 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update(); //refresh
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
      myServices.sharedPreferences.getString('id')!,
      itemsid,
    );
    print("=========addFavorite======Controller============  $response ");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "المفضه",
          messageText: const Text("تم اضافة المنتج الي المفضلة "),
        );
        //fl data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم حذف المنتج من المفضلة "),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }
  
}
