import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

class CheckOutOrdersData {
  Crud crud;
  CheckOutOrdersData(this.crud);
  getData(Map data) async {
    var response = await crud.postData(AppLink.checkOrders, data);
    return response.fold((l) => l, (r) => r);
  }
}
