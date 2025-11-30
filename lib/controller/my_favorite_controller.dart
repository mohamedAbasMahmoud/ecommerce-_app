import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/functions/handling_Data.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/data/datasource/remote/items/my_favorite_data.dart';
import 'package:ecommerce_cource/data/models/my_favorite.dart';
import 'package:get/get.dart';

//MyFavoriteData====view and delte--
class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  //  key => id items
  //  Value => 1 OR 0

  getData() async {
    //view data
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    print("==========getmyfavorite========== Controller $response ");
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        //تحويل كل عنصر ماب الي موديل
        data.addAll(
          responsedata.map((element) => MyFavoriteModel.fromJson(element)),
        );
        // print("data");
        print("::::::::::::$data");
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromMyFavorite(String favoriteid) {
    data.clear();
    var response = favoriteData.deleteData(favoriteid);
    data.removeWhere((element) => element.favoriteId == favoriteid);
    update();

    @override
    void onInit() {
      getData();
      super.onInit();
    }
  }

  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
  }
}
