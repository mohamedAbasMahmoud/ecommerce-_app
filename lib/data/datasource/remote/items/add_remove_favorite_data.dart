import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

//ad favorite and remove fav--
class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.favoriteAdd, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.favoriteRemove, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
