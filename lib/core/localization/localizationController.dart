import 'package:ecommerce_cource/core/constant/app_theme.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Localizationcontroller extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish; //default
  //changeLang
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    // theme  تغيير حسب اللغه
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);

    language = locale; // 🟢 تحديث القيمة المخزنة
    Get.updateLocale(locale);
    update(); // 🟢 إعادة بناء الواجهات المرتبطة بـ GetBuilder
  }

  ////////////////////////////locatin----------------------------Copy and paste
  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
    }
  }

  @override
  void onInit() {
    String? shredprefLang = myServices.sharedPreferences.getString("lang");
    if (shredprefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (shredprefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    requestPermissionLocation();
    super.onInit();
  }
}
