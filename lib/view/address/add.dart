import 'package:ecommerce_cource/controller/address/add_address_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class addressAdd extends StatelessWidget {
  const addressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController addAddressController = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
          //color: Colors.white,
        ),
        title: Text('add new address'),
      ),
      body: GetBuilder<AddAddressController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: addAddressController.statusRequest,
            widget: Stack(
              alignment: Alignment.center,
              children: [
                if (addAddressController.kGooglePlex != null)
                  GoogleMap(
                    markers: addAddressController.addMArker.toSet(),
                    mapType: MapType.normal,
                    initialCameraPosition: addAddressController.kGooglePlex!,
                    onMapCreated: (GoogleMapController controller) {
                      addAddressController.completercontroller!.complete(
                        controller,
                      );
                    },
                    onTap: (latLong) {
                      addAddressController.addMarkers(latLong);
                    },
                  ),

                Positioned(
                  bottom: 10,
                  child: Container(
                    color: AppColor.primaryColor,
                    child: MaterialButton(
                      minWidth: 250,
                      onPressed: () {
                        controller.goToDetailsAddress();
                      },
                      child: Text(
                        " Add Details Address",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
