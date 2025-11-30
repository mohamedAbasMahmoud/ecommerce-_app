
import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

class TesData {
  Crud crud;
  TesData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.test, {});

    return response.fold((l) => l, (r) => r);
  }
}
