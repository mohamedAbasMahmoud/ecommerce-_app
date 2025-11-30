import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/orders/archive_data.dart';
import 'package:ecommerce_cource/data/datasource/remote/orders/rating_data.dart';
import 'package:ecommerce_cource/data/models/orders_model.dart';
import 'package:get/get.dart';

class ArchiveOrdersController extends GetxController {
  ArchiveData archiveData = ArchiveData(Get.find());
  Rating ratingDialog = Rating(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];
  //نوع التوصيل

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  //طريقه الدفع
  String printPaymentMethode(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
  }

  //حاله الطلب فين؟
  String printStatusOrder(String val) {
    if (val == "0") {
      return "Waiting Approve";
    } else if (val == "1") {
      return "The orders is being Prepare";
    } else if (val == "2") {
      return "ready to picked up by delivey";
    } else if (val == "3") {
      return "On the way";
    } else {
      return "Archive";
    }
  }

  archiveOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await archiveData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("==========archiveOrders======= $response ");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        //print("Order ID sent::: ${ordersModel!.ordersId}");

        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  ///Rating===========
  submetRating(String userID, double rating, String comment) async {
    statusRequest = StatusRequest.loading;
    var response = await ratingDialog.getData(
      userID,
      rating.toString(),
      comment,
    );
    print("=========submetRating========= $response");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        archiveOrders();
        // Get.toNamed(AppRoutes.archiveOrders);
        print("success rating");
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    archiveOrders();
  }

  @override
  void onInit() {
    archiveOrders();
    super.onInit();
  }
}
