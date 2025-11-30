import 'package:ecommerce_cource/controller/orders/orders_pendding_controllers.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/data/models/orders_model.dart';
import 'package:ecommerce_cource/view/screen/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WaitingOrdersScreen extends StatelessWidget {
  const WaitingOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(title: Text("Waiting Orders")),
      body: Container(
        padding: EdgeInsets.all(12),

        child: GetBuilder<OrdersController>(
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardOrdersList(ordersModel: controller.data[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

class CardOrdersList extends GetView<OrdersController> {
  const CardOrdersList({super.key, this.ordersModel});
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
            if (ordersModel!.ordersStatus == '0')
              MaterialButton(
                onPressed: () {
                  ordersModel!.ordersId;
                },
                color: AppColor.primaryLightColor,
                child: Text(
                  "Delete",

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
