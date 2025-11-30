
import 'package:ecommerce_cource/controller/orders/archive_controller.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/data/models/orders_model.dart';
import 'package:ecommerce_cource/view/widget/checkout/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ArchiveCardOrdersList extends GetView<ArchiveOrdersController> {
  const ArchiveCardOrdersList({super.key, this.ordersModel});
  final OrdersModel? ordersModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: ListTile(
            title: Text(
              "OrdersNumber:"
              "${ordersModel!.ordersId}",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 4),
        Card(
          child: ListTile(
            title: Text(
              "OrderType:"
              "${controller.printOrderType(ordersModel!.ordersType!)}",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 4),

        Card(
          child: ListTile(
            title: Text(
              "OrdersPrice:"
              "${ordersModel!.ordersPrice}",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 4),

        Card(
          child: ListTile(
            title: Text(
              "Delivery price:"
              "${ordersModel!.ordersPricedelivery}",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 4),

        Card(
          child: ListTile(
            title: Text(
              "PAyment:"
              "${controller.printPaymentMethode(ordersModel!.ordersPaymentmethode!)}",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Divider(thickness: 5, color: Colors.black),
        Row(
          children: [
            Text(
              "Total Price:"
              "${ordersModel!.ordersTotalprice}",
              style: TextStyle(color: AppColor.primaryColor, fontSize: 21),
            ),
            Spacer(),
            MaterialButton(
              onPressed: () {
                Get.toNamed(
                  AppRoutes.ordersdetails,
                  arguments: {"ordersModel": ordersModel},
                );
              },
              color: AppColor.primaryLightColor,
              child: Text(
                "Details",

                style: TextStyle(
                  fontSize: 19,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 8),
            MaterialButton(
              onPressed: () {
                showRatingDialog(context, ordersModel!.ordersId!);
              },
              color: AppColor.primaryLightColor,
              child: Text(
                "Rating",

                style: TextStyle(
                  fontSize: 19,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
