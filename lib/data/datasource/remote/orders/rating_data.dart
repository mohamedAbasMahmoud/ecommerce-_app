import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

class Rating {
  Crud crud;
  Rating(this.crud);
  getData(String id, String rating, String comment) async {
    var response = await crud.postData(AppLink.rating, {
      "orderid": id,
      "rating": rating,
      "comment": comment,
    });

    return response.fold((l) => l, (r) => r);
  }
}
