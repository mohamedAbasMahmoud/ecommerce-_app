import 'package:ecommerce_cource/controller/orders/orders_details_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController odersDetailsController = Get.put(
      OrdersDetailsController(),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Orders Details")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<OrdersDetailsController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 19),
                    child: Card(
                      child: Column(
                        children: [
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Text(
                                    "Items",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              //  SizedBox(height: 12,),
                              ...List.generate(controller.data.length, (Index) {
                                return TableRow(
                                  children: [
                                    Text(
                                      "${controller.data[Index].itemName}",
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "${controller.data[Index].itemCount}",
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "${controller.data[Index].itemPrice}",
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                );
                              }),
                              // TableRow(
                              //   children: [
                              //     Text("Items", textAlign: TextAlign.center),
                              //     Text("QTY", textAlign: TextAlign.center),
                              //     Text("Price", textAlign: TextAlign.center),
                              //   ],
                              // ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Price:${controller.ordersModel!.ordersPrice}",
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    child: Container(
                      child: ListTile(
                        title: Text(
                          " Shipping Address",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          "${odersDetailsController.ordersModel!.addressCity} "
                          "${odersDetailsController.ordersModel!.addressStreet}",
                        ),
                      ),
                    ),
                  ),

                  Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        //markers: odersDetailsController.addMArker.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition:
                            odersDetailsController.kGooglePlex!,
                        onMapCreated: (GoogleMapController controller) {
                          odersDetailsController.completercontroller!.complete(
                            controller,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
