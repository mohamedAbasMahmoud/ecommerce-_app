import 'package:ecommerce_cource/controller/orders/archive_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/view/screen/orders/archive_card_orders_liast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());
    return Scaffold(
      appBar: AppBar(title: Text("Archive Orders")),
      body: Container(
        padding: EdgeInsets.all(12),

        child: GetBuilder<ArchiveOrdersController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return ArchiveCardOrdersList(
                    ordersModel: controller.data[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
