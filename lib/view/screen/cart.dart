import 'package:ecommerce_cource/controller/cart_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/view/widget/cart/custom_bottom_navigationbar_cart.dart';
import 'package:ecommerce_cource/view/widget/cart/custom_card_list.dart';
import 'package:ecommerce_cource/view/widget/cart/under_appbar_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => CustomBottomNavigationBarCart(
          price: '${controller.priceorders}',
          discount: '${controller.discountCoupon}',
          totalPrice: '${controller.getTotalPrice()}',
          couponController: controller.controllerCoupon!,
          onApplyCoupon: () {
            controller.checkCoupon();
          },
          shipping: '1',
        ),
      ),
      appBar: AppBar(title: Text('My Cart')),
      body: GetBuilder<CartController>(
        builder: (controller) {
          return
          // controller.data.isEmpty
          //     ? Center(child: CircularProgressIndicator())
          //     :
          HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                // TopAppbarCart(),
                UnderAppbarCart(
                  title:
                      ""
                      'You Have "${cartController.totalcountitems}" Items In Your Cart',
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(cartController.data.length, (index) {
                        return CustomItemsCardList(
                          name:
                              '${cartController.data[index].itemName}', //data[index].itemName
                          price: '${cartController.data[index].itemPrice}',
                          count: '${cartController.data[index].itemCount}',
                          imageName: '${controller.data[index].itemImage}',
                          onAdd: () async {
                            await cartController.add(
                              cartController.data[index].itemId!,
                            );
                          },
                          onRemove: () async {
                            await controller.delete(
                              controller.data[index].itemId!,
                            );
                          },
                        );
                      }),
                    ],
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
