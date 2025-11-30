import 'package:ecommerce_cource/controller/check_email_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_body.dart';
import 'package:ecommerce_cource/view/screen/auth/custom_title.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_bottun.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_text_form_feiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//التحقق من الايميل عند انشاء الحساب
class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Check Email ',

          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const customTitle(title: 'Success Sign Up'),
            const SizedBox(height: 40),
            const CustomTextBody(
              text: 'Please Enter Your Email To Recieve A Verification Code ',
            ),
            const SizedBox(height: 30),

            CustomTextFormFieled(
              isNumber: false,
              valid: (val) {},
              hitnText: 'Enter Your Email',
              labelText: 'Email',
              sufIcon: Icon(Icons.email_outlined),
              myController: controller.email,
            ),
            const SizedBox(height: 45),

            CustomBottun(
              onTap: () {
                controller.goToVerfyCode();
              },
              title: 'Check',
              color: AppColor.primaryColor,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
