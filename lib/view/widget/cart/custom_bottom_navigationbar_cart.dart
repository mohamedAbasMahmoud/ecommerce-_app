import 'package:ecommerce_cource/controller/cart_controller.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/view/widget/cart/bottom_button.dart';
import 'package:ecommerce_cource/view/widget/cart/custom_button_coupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBarCart extends GetView<CartController> {
  const CustomBottomNavigationBarCart({
    super.key,
    required this.price,
    required this.totalPrice,
    required this.discount,
    required this.couponController,
    required this.onApplyCoupon,
    required this.shipping,
  });
  final String price;
  final String totalPrice;
  final String discount;
  final String shipping;
  final TextEditingController couponController;
  final void Function()? onApplyCoupon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder: (controller) => controller.couponName == null
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: couponController,
                            cursorColor: AppColor.primaryColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 10,
                              ),
                              isDense: true,

                              //prefixIcon: Icon(Icons.card_giftcard, ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.primaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColor.primaryColor,
                                ),
                              ),
                              hintText: 'coupon Code',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,

                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textbutton: 'Apply',
                            onPressed: onApplyCoupon,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Text(
                      'Coupon Code:  ${controller.couponName}',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          //SizedBox(height: 4),
          // Divider(thickness: .2, color: AppColor.secondColor),
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColor.primaryLightColor,
              border: Border.all(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      "$price\$",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  indent: 60,
                  endIndent: 60,
                  color: AppColor.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "discount",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      discount,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  indent: 60,
                  endIndent: 60,
                  color: AppColor.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "shipping",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      shipping,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                Divider(
                  indent: 60,
                  endIndent: 60,
                  thickness: 3,
                  color: AppColor.secondColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Total Price", //text
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Text(
                      totalPrice,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Divider(indent: 60, endIndent: 60),
          CustomButtonCart(
            textbutton: 'Order',
            onPressed: () {
              controller.goToPageCheckOut();
            },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
