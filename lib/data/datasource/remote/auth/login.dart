
//عمليه تحقق من وجود اليوزر او لا
import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password,) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
     
    });

    return response.fold((l) => l, (r) => r);
  }
}
