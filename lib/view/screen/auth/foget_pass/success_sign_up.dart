import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/view/widget/langauge/custom_button_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SuccessSignUpControllerImp controller =
    //     Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          '32'.tr,
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "37".tr,
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 30),
            ),
            Text("38".tr),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed("/login");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  '43'.tr,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
