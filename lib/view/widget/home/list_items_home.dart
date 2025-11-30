import 'package:ecommerce_cource/controller/home_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/data/models/items_model.dart';
import 'package:ecommerce_cource/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return ItemsHome(
            itemsModel: ItemsModel.fromJson(controller.items[i]),
          );
        },
      ),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  const ItemsHome({super.key, required this.itemsModel});

  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              "${AppLink.imageItems}/${itemsModel.itemImage}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 120,
            width: 200,
          ),
          Positioned(
            left: 10,
            child: Text(
              "${itemsModel.itemImage}",
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
