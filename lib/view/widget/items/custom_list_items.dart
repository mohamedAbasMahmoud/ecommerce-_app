import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_cource/controller/add_remove_favorite_controller.dart';
import 'package:ecommerce_cource/controller/items_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/constant/imageasset.dart';
import 'package:ecommerce_cource/core/functions/translate_database.dart';
import 'package:ecommerce_cource/data/models/items_model.dart';
import 'package:ecommerce_cource/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends StatelessWidget {
  const CustomListItems({super.key, required this.itemsModel});

  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    //FavoriteController favoriteController = Get.put(FavoriteController());
    return GestureDetector(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    //animation مع الانتقال
                    tag: "${itemsModel.itemId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageItems}/${itemsModel.itemImage?.trim() ?? ''}",
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),

                  SizedBox(height: 10),
                  Text(
                    translateDatabase(
                      itemsModel.itemNameAr,
                      itemsModel.itemName,
                    ),
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "${itemsModel.itemDesc}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.timer_sharp, color: Colors.black),
                      SizedBox(width: 20),
                      Text(
                        " ${controller.deliverytime}: Minits",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'sans',
                        ),
                      ),
                      //     Container(
                      //   alignment: Alignment.bottomCenter,
                      //   height: 22,
                      //   child: Row(
                      //     children: [
                      //       ...List.generate(
                      //         5,
                      //         (index) => Icon(Icons.star, size: 15),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemPriceDiscount}",
                        style: TextStyle(
                          color: AppColor.secondColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) {
                          return IconButton(
                            onPressed: () {
                              if (controller.isFavorite[itemsModel.itemId] ==
                                  '1') {
                                controller.setFavorite(itemsModel.itemId, "0");
                                controller.removeFavorite(itemsModel.itemId!);
                              } else {
                                controller.setFavorite(itemsModel.itemId, "1");
                                controller.addFavorite(itemsModel.itemId!);
                              }
                            },
                            icon: Icon(
                              controller.isFavorite[itemsModel.itemId] == '1'
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: AppColor.secondColor,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              if (itemsModel.itemDiscount != "0")
                Positioned(
                  top: -4,
                  left: -4,
                  child: Image.asset(AppImageAsset.discount, width: 40),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
