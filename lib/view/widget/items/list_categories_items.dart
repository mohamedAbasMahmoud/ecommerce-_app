import 'package:ecommerce_cource/controller/items_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/functions/translate_database.dart';
import 'package:ecommerce_cource/data/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  ListCategoriesItems({super.key});
  final ItemsControllerImp controller = Get.put(ItemsControllerImp());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return //Container(height: 100, color: Colors.black);
          Categories(
            i: index,
            categoriesModel: controller.categories[index],
            //  CategoriesModel.fromJson(
            //   controller.categories[index],
            // ),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  const Categories({super.key, required this.i, required this.categoriesModel});

  final CategoriesModel categoriesModel;
  final int i;
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return GestureDetector(
      onTap: () {
        controller.changeCat(i);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) {
              return Container(
                decoration: controller.selectedCat == i
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: AppColor.secondColor,
                          ),
                        ),
                      )
                    : null,
                child: Text(
                  "${translateDatabase(categoriesModel.categoriesNamaAr, categoriesModel.categoriesName)}",
                  style: const TextStyle(fontSize: 20, color: AppColor.black),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
