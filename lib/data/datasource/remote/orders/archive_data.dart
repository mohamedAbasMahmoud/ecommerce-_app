import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.archiveOrders, {
      "id": usersid,
    });

    return response.fold((l) => l, (r) => r);
  }
}
