import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

class HomeDate {
  Crud crud;
  HomeDate(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.homeScreen, {});

    return response.fold((l) => l, (r) => r);
  }

  searhData(String Search) async {
    var response = await crud.postData(AppLink.searchitems, {'search': Search});
    return response.fold((l) => l, (r) => r);
  }
}
