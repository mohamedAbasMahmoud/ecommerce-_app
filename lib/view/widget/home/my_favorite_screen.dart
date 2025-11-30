import 'package:ecommerce_cource/controller/my_favorite_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/view/widget/home/custom_appbar.dart';
import 'package:ecommerce_cource/view/widget/my_favorite_list_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: GetBuilder<MyFavoriteController>(
          //init:MyFavoriteController() ,
          builder: (controller) {
            return ListView(
              children: [
                // customAppBar(
                //   titleAppbar: 'Find Your Ptoduct',
                //   onPressedSearch: () {},
                //   onPressedfavorite: () {
                //     // Get.toNamed(AppRoutes.myFavorite);
                //   },
                // ),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // عدد الأعمدة
                          mainAxisSpacing: 10, // المسافة العمودية
                          crossAxisSpacing: 10, // المسافة الأفقية
                          childAspectRatio: 0.7, // النسبة بين العرض والارتفاع
                        ),
                    itemBuilder: (context, index) {
                      return CustomListFavoriteItems(
                        itemsModel: controller.data[index],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
