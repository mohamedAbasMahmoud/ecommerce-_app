import 'package:ecommerce_cource/controller/home_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/functions/translate_database.dart';
import 'package:ecommerce_cource/data/models/categories.dart';
import 'package:ecommerce_cource/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListViewCategories extends GetView<HomeControllerImp> {
  const ListViewCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel: CategoriesModel.fromJson(
              controller.categories[index],
            ),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  const Categories({super.key, required this.i, required this.categoriesModel});

  final CategoriesModel categoriesModel;
  final int? i;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goItems(
          controller.categories,
          i!,
          categoriesModel.categoriesId!,
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.thirdColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
              color: AppColor.secondColor,
            ),
          ),
          Text(
            "${translateDatabase(categoriesModel.categoriesNamaAr, categoriesModel.categoriesName)}",
            style: const TextStyle(fontSize: 13, color: AppColor.black),
          ),
        ],
      ),
    );
  }
}
