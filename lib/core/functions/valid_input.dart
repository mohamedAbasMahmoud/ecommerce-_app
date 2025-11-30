//params
import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "userName") {
    if (!GetUtils.isUsername(val)) {
      return "not valid user name";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  if (val.length < min) {
    return "value cant be less than $min";
  }
  if (val.length > max) {
    return "value cant be larger than $max";
  }

   if (val.isEmpty ) {
    return "value cant be Empty";
  }
}
