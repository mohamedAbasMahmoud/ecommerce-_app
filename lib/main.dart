
import 'package:ecommerce_cource/bindings.dart';
import 'package:ecommerce_cource/core/localization/localizationController.dart';
import 'package:ecommerce_cource/core/localization/translation.dart';
import 'package:ecommerce_cource/core/services/services.dart';
import 'package:ecommerce_cource/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initialServices();
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Localizationcontroller controller = Get.put(Localizationcontroller());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      locale: controller.language,
      initialBinding: MyBindings(),
      //home: Login(),
      getPages: routes,
    );
  }
}
