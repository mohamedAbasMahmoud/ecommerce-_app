import 'package:ecommerce_cource/controller/address/address_veiw_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/data/models/address_view._model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//AIzaSyDXJ1RjeFxp5-f8Sjhr-7Nl5rAtCKlahFI

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    VeiwAddressController controller = Get.put(VeiwAddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),

        onPressed: () {
          Get.toNamed(AppRoutes.addressAdd);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
          // color: Colors.white,
        ),
        title: Text('view Address'),
      ),
      body: Container(
        child: GetBuilder<VeiwAddressController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                child: ListView.builder(
                  itemCount: controller.dataView.length,
                  itemBuilder: (context, index) {
                    return CardAddress(
                      addressModel: controller.dataView[index],
                      onDelete: () {
                        controller.deleteAddress(
                          controller.dataView[index].addressId!,
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  const CardAddress({super.key, required this.addressModel, this.onDelete});
  final AddressViewModel addressModel;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.thirdColor,
      child: Container(
        child: ListTile(
          // style:ListTileStyle ,
          title: Text(
            '${addressModel.addressCity}',
            style: TextStyle(
              color: (Colors.black),
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('${addressModel.addressStreet}'),
          trailing: IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete_outline),
          ),
        ),
      ),
    );
  }
}
