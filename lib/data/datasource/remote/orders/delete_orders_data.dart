import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

class DeleteOrdersData {
  Crud crud;
  DeleteOrdersData(this.crud);
  deletaData(String ordersid) async {
    var response = await crud.postData(AppLink.deleteOrders, {"id": ordersid});

    return response.fold((l) => l, (r) => r);
  }
}
