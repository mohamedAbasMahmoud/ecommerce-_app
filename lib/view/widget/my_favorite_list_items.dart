import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_cource/controller/my_favorite_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/functions/translate_database.dart';
import 'package:ecommerce_cource/data/models/my_favorite.dart';
import 'package:ecommerce_cource/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  const CustomListFavoriteItems({
    super.key,
    required this.itemsModel,
     });

  final MyFavoriteModel itemsModel;
   @override
  Widget build(BuildContext context) {
      return GestureDetector(
      onTap: () {
        // controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
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
                translateDatabase(itemsModel.itemNameAr, itemsModel.itemName),
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
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rating 3.5 ", textAlign: TextAlign.center),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(Icons.star, size: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsModel.itemPrice}",
                    style: TextStyle(
                      color: AppColor.secondColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteFromMyFavorite(itemsModel.favoriteId!);
                    },
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
