import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_cource/controller/product_details_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/link_api.dart';
import 'package:ecommerce_cource/view/widget/product_details/counter_price.dart';
import 'package:ecommerce_cource/view/widget/product_details/custom_button_product.dart';
import 'package:ecommerce_cource/view/widget/product_details/sub_items_list_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductControllerImp controller = Get.put(ProductControllerImp());
    return Scaffold(
      bottomNavigationBar: CustomButtonProductDetails(),
      body: GetBuilder<ProductControllerImp>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(25),
                          ),
                        ),
                        child: Hero(
                          tag: "${controller.itemsModel.itemId}",
                          child: Center(
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl:
                                  AppLink.imageItems +
                                  "/" +
                                  controller.itemsModel.itemImage!,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.itemsModel.itemName}",

                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(
                                color: AppColor.fourthColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        CounterPrice(
                          price: controller.itemsModel.itemPriceDiscount!,
                          ///////
                          count: '${controller.countsItems}',
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                          
                            controller.remove();
                          },
                        ),
                        SizedBox(height: 12),
                        Text(
                          "${controller.itemsModel.itemDesc}",

                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppColor.fourthColor),
                        ),
                        SizedBox(height: 25),

                        // Text(
                        //   "Color",
                        //   style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        //     color: Colors.black,
                        //     fontSize: 21,
                        //   ),
                        // ),

                        //SizedBox(height: 15),
                        // SubItemsListColors(controller: controller),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
