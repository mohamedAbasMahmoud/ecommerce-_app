import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

//ad favorite and remove fav--
class CartData {
  Crud crud;
  CartData(this.crud);

  addToCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartadd, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartdelete, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountsCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartgetcountitems, {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartview, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  coupon(String couponName) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      "couponname": couponName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
