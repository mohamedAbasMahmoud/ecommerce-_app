import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';
//MyFavoriteController-----view and delete
class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(String id) async {
    var response = await crud.postData(AppLink.favoriteView, {'id': id});

    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(AppLink.deleteFromFavorite, {'id': id});//asign

    return response.fold((l) => l, (r) => r);
  }
}
