import 'package:ecommerce_cource/controller/cart_controller.dart';
import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/data/models/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;
  CartController cartController = Get.put(CartController());
  late StatusRequest statusRequest;
  int countsItems = 0;
  //اثناء الفتح
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments["itemsModel"];
    countsItems = await cartController.getCountsItems(itemsModel.itemId!);

    statusRequest = StatusRequest.success;
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'},
  ];

  add() {
    cartController.add(itemsModel.itemId!);
    countsItems++;
    update();
  }

  remove() {
    cartController.delete(itemsModel.itemId!);
    countsItems--;
    update();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }
}
