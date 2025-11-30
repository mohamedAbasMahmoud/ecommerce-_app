import 'package:ecommerce_cource/controller/checkout_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/constant/imageasset.dart';
import 'package:ecommerce_cource/view/widget/checkout/card_payment_checkout.dart';
import 'package:ecommerce_cource/view/widget/checkout/card_shipping_address.dart';
import 'package:ecommerce_cource/view/widget/checkout/delivery_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.put(CheckoutController());
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),

        child: MaterialButton(
          textColor: Colors.white,
          color: AppColor.primaryColor,
          onPressed: () {
            checkoutController.checkOutOrders();
          },
          child: Text(
            'Chech Out',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),

      appBar: AppBar(title: Text("Check Out")),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.all(22),
            child: ListView(
              children: [
                Text(
                  'Choose Payment Methode',
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.checkPaymentMethode(
                      "0",
                    ); //0>cashلان db tinyint=0.1
                  },
                  child: CardPaymentCheckOut(
                    title: 'Cash On Delivery',
                    isActive: controller.paymentMethode == "0" ? true : false,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    controller.checkPaymentMethode("1"); //1>card
                  },
                  child: CardPaymentCheckOut(
                    title: 'Payments Card',
                    isActive: controller.paymentMethode == "1" ? true : false,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Choose Delivery Type',
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.checkShippingType("Delivery");
                      },
                      child: DeliveryType(
                        imageName: AppImageAsset.deliveryImage2,
                        title: 'Delivery',
                        isActive: controller.shippingType == "Delivery"
                            ? true
                            : false,
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        controller.checkShippingType("1");
                      },
                      child: DeliveryType(
                        imageName: AppImageAsset.drivethruImage,
                        title: 'Recive',
                        isActive: controller.shippingType == "1" ? true : false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Divider(color: AppColor.thirdColor),
                if (controller.shippingType == "Delivery")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Shipping Address.',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      if (controller.dataAddress.isEmpty)
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.addressAdd);
                          },
                          child: Container(
                            child: Text(
                              "Please Add Shipping Address\nClick here",
                            ),
                          ),
                        ),

                      ...List.generate(controller.dataAddress.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.checkAddress(
                              controller.dataAddress[index].addressId!,
                            );
                          },
                          child: CartShippingAddress(
                            title: controller.dataAddress[index].addressName!,
                            subTitle:
                                controller.dataAddress[index].addressStreet!,
                            isActive:
                                controller.addressId ==
                                    controller.dataAddress[index].addressId
                                ? true
                                : false,
                          ),
                        );
                      }),
                      SizedBox(height: 8),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
