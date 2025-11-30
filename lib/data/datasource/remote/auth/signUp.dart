//create new user
import 'package:ecommerce_cource/core/class/crud.dart';
import 'package:ecommerce_cource/link_api.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String userName, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "userName": userName,
      "password": password,
      "email": email,
      "phone": phone,
    });

    return response.fold((l) => l, (r) => r);
  }
}
