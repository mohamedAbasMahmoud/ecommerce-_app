import 'package:ecommerce_cource/controller/home_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/view/widget/home/customCardHome.dart';
import 'package:ecommerce_cource/view/widget/home/custom_appbar.dart';
import 'package:ecommerce_cource/view/widget/home/custom_favorite.dart';
import 'package:ecommerce_cource/view/widget/home/listCategoriesHome.dart';
import 'package:ecommerce_cource/view/widget/home/list_items_home.dart';
import 'package:ecommerce_cource/view/widget/home/list_items_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            customAppBar(
              myController: controller.search!,

              titleAppbar: 'Find Your Product',
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onPressedfavorite: () {
                Get.toNamed(AppRoutes.myFavorite);
              },
            ),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.isSearch
                  ? ListItemsSearch(listdatamodel: controller.listSearchData)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.settingsData.isNotEmpty)
                          customCardHome(
                            title:
                                "${controller.settingsData[0]["settings_titlehome"]}",
                            body:
                                "${controller.settingsData[0]["settings_bodyhome"]}",
                          ),
                        CustomHomeTitle(title: "47".tr),
                        ListViewCategories(),
                        const SizedBox(height: 10),
                        CustomHomeTitle(title: "Top Selling"),
                        const SizedBox(height: 10),
                        ListItemsHome(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
