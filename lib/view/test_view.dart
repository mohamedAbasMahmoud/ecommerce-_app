import 'package:ecommerce_cource/controller/test_controller.dart';
import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Title")),

        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          if (controller.statusRequest == StatusRequest.loading) {
            return Center(
              child: Lottie.asset(
                AppImageAsset.loading,
                height: 200,
                width: 200,
              ),
            );
          } else if (controller.statusRequest == StatusRequest.offlinefailure) {
            return Center(
              child: Lottie.asset(
                AppImageAsset.offline,
                height: 200,
                width: 200,
              ),
            );
          } else if (controller.statusRequest == StatusRequest.serverfailure) {
            return Center(
              child: Lottie.asset(
                AppImageAsset.server,
                height: 200,
                width: 200,
              ),
            );
          } else if (controller.statusRequest == StatusRequest.failure) {
            return Center(child: Lottie.asset(AppImageAsset.noData));
          } else {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data}");
              },
            );
          }
        },
      ),
    );
  }
}
