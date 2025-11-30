import 'dart:io';

import 'package:ecommerce_cource/controller/main_screen_controller.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/view/widget/home/custom_button_appba.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          //backgroundColor: Colors.amber,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            onPressed: () {
              Get.toNamed(AppRoutes.cart);
            },
            child: Icon(Icons.shopping_basket_outlined),
            shape: const CircleBorder(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length + 1, ((index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CustomButtonAppBar(
                          textButton: controller.bottomappbar[i]['title'],
                          icon: controller.bottomappbar[i]['icon'],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          isActive: controller.currentPage == i ? true : false,
                        );
                })),
              ],
            ),
          ),
          body: WillPopScope(
            onWillPop: () {
              Get.defaultDialog(
                title: "Warning",
                middleText: "Do You Want To Exit App",
                titleStyle: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
                onCancel: () {},
                cancelTextColor: AppColor.primaryColor,
                confirmTextColor: AppColor.primaryColor,

                onConfirm: () {
                  exit(0);
                },
              );
              return Future.value(false);
            },
            child: controller.listPage.elementAt(controller.currentPage),
          ),
        );
      },
    );
  }
}
