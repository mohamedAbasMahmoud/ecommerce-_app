import 'dart:io';

import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';

alertExitApp() {
  return Get.defaultDialog(
    backgroundColor: AppColor.primaryLightColor,
    title: "45".tr,
    middleText: "46".tr,

    actions: [
      ElevatedButton(
        onPressed: () {
          exit(0); //للخروج من التطبيق
        },
        child: Text('confirm', style: TextStyle(color: Colors.black)),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back(); //لالغاء الالرت
        },
        child: Text('Cancel', style: TextStyle(color: Colors.black)),
      ),
    ],
  );
}
