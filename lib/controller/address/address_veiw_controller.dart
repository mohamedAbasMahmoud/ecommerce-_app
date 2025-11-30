import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/details_address_data.dart';
import 'package:ecommerce_cource/data/models/address_view._model.dart';

import 'package:get/get.dart';

class VeiwAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  List<AddressViewModel> dataView = [];
  ////==============deleteAddress
  deleteAddress(String addressid) {
    addressData.deleteData(addressid); //backend
    dataView.removeWhere((element) => element.addressId == addressid);
    update(); //frontend
  }

  getAddressData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.viewData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("======getAddress====  $response ");
    statusRequest = handlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        dataView.addAll(listData.map((e) => AddressViewModel.fromJson(e)));
        print('----address-dataView----$dataView');
        if (dataView.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getAddressData();
    super.onInit();
  }
}
