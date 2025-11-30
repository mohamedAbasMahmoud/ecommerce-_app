import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/details_address_data.dart';
import 'package:ecommerce_cource/data/datasource/remote/orders/checkout_orders_data.dart';
import 'package:ecommerce_cource/data/models/address_view._model.dart';
import 'package:ecommerce_cource/view/widget/checkout/delivery_type.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckOutOrdersData checkOutOrdersData = Get.put(
    CheckOutOrdersData(Get.find()),
  );
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethode;
  String? shippingType;
  String addressId = "0";
  String? couponId;
  String? priceOrders;
  List<AddressViewModel> dataAddress = [];
  late String coupondiscount;
  checkPaymentMethode(String val) {
    paymentMethode = val;
    update();
  }

  checkShippingType(String val) {
    shippingType = val;
    update();
  }

  checkAddress(String val) {
    addressId = val;
    update();
  }

  getAddressDelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("======getAddress====  $response ");
    statusRequest = handlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responssData = response['data'];
        dataAddress.addAll(
          responssData.map((e) => AddressViewModel.fromJson(e)),
        );
        addressId = dataAddress[0].addressId.toString();

        print('----Delivery-address-----$dataAddress');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  //add orders======CheckOut==
  checkOutOrders() async {
    if (paymentMethode == null)
      return Get.snackbar("Error", "please sellect paymentMethode ");
    if (shippingType == null)
      return Get.snackbar("Error", "please sellect DeliveryType");
    if (dataAddress.isEmpty)
      return Get.snackbar("Error", "please sellect your address");

    statusRequest = StatusRequest.loading;
    update();
    Map<String, String> data = {
      "usersid": myServices.sharedPreferences.get("id")?.toString() ?? "",
      "addressid": addressId?.toString() ?? "",
      "orderstype": shippingType?.toString() ?? "",
      "pricedelivery": "12",
      "ordersprice": priceOrders?.toString() ?? "",
      "couponid": couponId?.toString() ?? "",
      "coupondiscount": coupondiscount?.toString() ?? "",
      "paymentmethod": paymentMethode?.toString() ?? "",
    };
    print("==== Parameters before sending ===========================");
    data.forEach((key, value) {
      print("$key : $value");
    });
    print("===================================");

    var response = await checkOutOrdersData.getData(data);
    print("======checkOutOrders====  $response ");
    statusRequest = handlingdata(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.mainScreen);
        Get.snackbar("تمت بنجاح", "تم");
        //("success");
        print('----Delivery-address-----$dataAddress');
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("خطا", "حاول مرة اخري");
      }
    }
    update();
  }

  @override
  void onInit() {
    //checkOutOrders();
    couponId = Get.arguments['couponid'];
    priceOrders = Get.arguments['priceorders'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    getAddressDelivery();
    super.onInit();
  }
}
