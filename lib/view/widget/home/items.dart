import 'package:ecommerce_cource/controller/add_remove_favorite_controller.dart';
import 'package:ecommerce_cource/controller/items_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/view/widget/home/custom_appbar.dart';
import 'package:ecommerce_cource/view/widget/home/list_items_search.dart';
import 'package:ecommerce_cource/view/widget/items/custom_list_items.dart';
import 'package:ecommerce_cource/view/widget/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.put(FavoriteController());
    ItemsControllerImp itemsControllerImp = Get.put(ItemsControllerImp());
    Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) => ListView(
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
              const SizedBox(height: 8),
              ListCategoriesItems(),
              const SizedBox(height: 18),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch
                    ? ListItemsSearch(listdatamodel: controller.listSearchData)
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length, //
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 15,
                            ),
                        itemBuilder: (BuildContext context, int index) {
                          favoriteController.isFavorite[controller
                                  .data[index]
                                  .itemId] =
                              controller.data[index].favorite;

                          return CustomListItems(
                            itemsModel: controller.data[index],
                            // isActive: false,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
