import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/cart/cart_data.dart';
import 'package:ecommerce_cource/data/models/cart_model.dart';
import 'package:ecommerce_cource/data/models/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  //coupon variables
  TextEditingController? controllerCoupon;
  CouponModel? couponModel;
  int? discountCoupon = 0;
  String? couponName;
  String? couponId;
  //view--variables
  //CartModel? cartModel;
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0;
  //////////////////////////////////////////////////////////////////////////////
  ////---------------------add---------------
  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addToCart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("=========addToCart============$response");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        print("تمت الاضافه بنجاح");
        Get.rawSnackbar(
          title: "تنبيه",
          messageText: const Text("تم اضافة المنتج الى السلة "),
        );
        view();
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  /////------------------delete--------------------------
  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.removeCart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("==============deletefromCart===========  $response ");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        print("تم الحزف بنجاح");
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم ازالة المنتج من السلة "),
        );
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  ///------------------getCountsItems---------
  getCountsItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.getCountsCart(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    print("==================cooooounts=============  $response ");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int totalcountitems = 0;

        totalcountitems = int.parse(response['data']);
        print("==========عدد الايتميز=====$totalcountitems");

        return totalcountitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  ///------------------checkCoupon---------
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.coupon(controllerCoupon!.text);
    print("===============checkCoupon=========  $response ");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        // success state
        Map<String, dynamic> couponData = response['data'];
        couponModel = CouponModel.fromJson(couponData);
        discountCoupon = int.parse(couponModel!.couponDiscount!);

        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId;
      } else {
        discountCoupon = 0;
        couponName = null;
        couponId = null;
        Get.snackbar("Warning", "this coupon unvalid");
        // statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountCoupon! / 100);
  }

  //اعادة تعيين متغيرات
  refreshVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    // data.clear();
  }

  //يجيب بيانات من الاول
  refreshPage() {
    refreshVarCart();
    view();
  }

  goToPageCheckOut() {
    // if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    Get.toNamed(
      AppRoutes.checkout,
      arguments: {
        'couponid': couponId,
        'priceorders': priceorders.toString(),
        'discountcoupon': discountCoupon.toString(),
      },
    );
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart(
      myServices.sharedPreferences.getString("id")!,
    );
    print("=============viewCart===========  $response ");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        //if (response['Datacart']['status'] == 'success')
        // {
        List dataresponse = response['datacart'];
        Map dataresponsecountprice = response['countprice'];
        data.clear();
        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
        print(data);
        totalcountitems = int.parse(dataresponsecountprice['totalcount']);
        priceorders = double.parse(dataresponsecountprice['totalprice']);
        print(priceorders);
      }
    } else {
      statusRequest = StatusRequest.failure;
      // }
      // End
    }
    update();
  }
  // //العمليات  الحسابيه--
  // viewCart() async {
  //   print("get data");
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await cartData.viewCart(
  //     myServices.sharedPreferences.getString("id")!,
  //   );
  //   print("================viewCart=============  $response ");
  //   statusRequest = handlingdata(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       //if (response['datacart']['status'] == 'success') {
  //      // var data = response;
  //       //cartModel = CartModel.fromJson(data);
  //        List dataresponse = response['datacart']['data'];

  //        //Map dataresponse = response['datacart'];
  //        Map dataresponsecountprice = response['countprice'];
  //        data.clear();
  //        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
  //        totalcountitems = int.parse(dataresponsecountprice['totalcount']);
  //        priceorders = double.parse(data['totalprice']);
  //        print('--------سعر الاوردر--------$priceorders');
  //     }
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //   }
  //   // End
  //   // }
  //   update();
  // }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    //getCountsItems();
    view();
    super.onInit();
  }
}
