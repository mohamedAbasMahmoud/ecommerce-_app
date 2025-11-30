import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/details_address_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailsAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;
  init() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print('lang------$long');
    print('lat-------$lat');
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  addAddressDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addData(
      myServices.sharedPreferences.getString("id")!,
      name!.text,
      city!.text,
      street!.text,

      lat!,
      long!,
    );
    //print("RESPONSE BODY: ${response.body}");

    print("======addAddressDetails==== Controller $response ");
    statusRequest = handlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.mainScreen);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
