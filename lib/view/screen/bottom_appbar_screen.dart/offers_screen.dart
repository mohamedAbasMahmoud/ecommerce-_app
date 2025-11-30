import 'package:ecommerce_cource/controller/add_remove_favorite_controller.dart';
import 'package:ecommerce_cource/controller/offers_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/view/widget/home/custom_appbar.dart';
import 'package:ecommerce_cource/view/widget/home/list_items_search.dart';
import 'package:ecommerce_cource/view/widget/offer/CustomListItemsOffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OffersController controller = Get.put(OffersController());
    FavoriteController favoriteController = Get.put(FavoriteController());

    return Scaffold(
      //appBar: AppBar(title: Text("Offers")),
      body: GetBuilder<OffersController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(10),
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
                SizedBox(height: 7),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch
                      ? ListItemsSearch(
                          listdatamodel: controller.listSearchData,
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            return CustomListItemsOffers(
                              itemsModel: controller.data[index],
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
