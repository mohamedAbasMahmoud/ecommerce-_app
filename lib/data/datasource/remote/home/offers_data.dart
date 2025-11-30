import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.offers, {});

    return response.fold((l) => l, (r) => r);
  }
}
