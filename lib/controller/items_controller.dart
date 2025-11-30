import 'package:ecommerce_cource/controller/add_remove_favorite_controller.dart';
import 'package:ecommerce_cource/controller/search_controller.dart';
import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/items/items_data.dart';
import 'package:ecommerce_cource/data/models/categories.dart';
import 'package:ecommerce_cource/data/models/items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val);
  getItems(String categoryid);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  ItemsData itemsData = ItemsData(Get.find());

  List<CategoriesModel> categories = [];

  int? selectedCat;
  String deliverytime = "";

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;
  String? catgid;
  MyServices myServices = Get.find();
  List dyminCategory = [];
  FavoriteController favoriteController = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    deliverytime = myServices.sharedPreferences.getString("deliveryTime")!;
    dyminCategory = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCategory'];
    catgid = Get.arguments['categoryid'];

    categories.addAll(dyminCategory.map((e) => CategoriesModel.fromJson(e)));
    print(categories);

    getItems(catgid!);
  }

  @override
  changeCat(val) {
    //change underline
    selectedCat = val;
    getItems(categories[selectedCat!].categoriesId!);
    update();
  }

  @override
  getItems(categoryid) async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
      categoryid,
      myServices.sharedPreferences.getString('id')!,
    );
    statusRequest = handlingdata(response);
    print('===========GetItems=============$response');

    if (StatusRequest.success == statusRequest) {
      data.clear();
      if (response['status'] == "success") {
        List respone = response['data'];
        data.addAll(respone.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(
      AppRoutes.productDetails,
      arguments: {"itemsModel": itemsModel},
    );
  }
}
