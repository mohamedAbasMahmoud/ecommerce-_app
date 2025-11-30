import 'dart:async';
import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/orders/details_orders_data.dart';
import 'package:ecommerce_cource/data/models/cart_model.dart';
import 'package:ecommerce_cource/data/models/orders_details_model.dart';
import 'package:ecommerce_cource/data/models/orders_model.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  OrdersModel? ordersModel;
  StatusRequest? statusRequest;
  OrdersDetailsData odersDetailsData = OrdersDetailsData(Get.find());
  MyServices myServices = Get.find();
  Completer<GoogleMapController>? completercontroller;
  OrdersDetailsModel? ordersDetailsModel;
  CameraPosition? kGooglePlex;
  List<CartModel> data = [];
  //Position? position;
  //---marker----
  List<Marker> addMArker = [];
  double? long;
  double? lat;
  initialData() {
    kGooglePlex = CameraPosition(
      target: LatLng(
        double.parse("${ordersModel!.addressLat}"),
        double.parse("${ordersModel!.addressLong}"),
      ),
      zoom: 15.4746,
    );
    addMArker.add(
      //مكان الشخص الطالب
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(
          double.parse("${ordersModel!.addressLat}"),
          double.parse("${ordersModel!.addressLong}"),
        ),
      ),
    );
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersModel"];
    initialData();
    getOrdersDetailsData();
    // TODO: implement onInit
    super.onInit();
  }

  getOrdersDetailsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await odersDetailsData.getData(ordersModel!.ordersId!);
    print("======getOrdersDetailsData====  $response ");
    statusRequest = handlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responssData = response['data'];
        data.addAll(responssData.map((e) => CartModel.fromJson(e)));
        print('----getOrdersDetailsData-----$data');
      } else {
        print("Order ID sent::: ${ordersModel!.ordersId}");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
