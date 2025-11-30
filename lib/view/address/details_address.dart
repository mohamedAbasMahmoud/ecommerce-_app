import 'package:ecommerce_cource/controller/address/add_address_controller.dart';
import 'package:ecommerce_cource/controller/address/details_address_controller.dart';
import 'package:ecommerce_cource/core/class/handlingdataview.dart';
import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/shared/custom_button_default.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_bottun.dart';
import 'package:ecommerce_cource/view/widget/auth/custom_text_form_feiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsAddress extends StatelessWidget {
  const DetailsAddress({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsAddressController controller = Get.put(DetailsAddressController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
          //color: Colors.white,
        ),
        title: Text('Details Address'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<DetailsAddressController>(
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const SizedBox(height: 40),

                    CustomTextFormFieled(
                      hitnText: 'city',
                      labelText: 'city name',
                      sufIcon: Icon(Icons.location_city_outlined),
                      myController: controller.city!,
                      valid: (val) {},
                      isNumber: false,
                    ),
                    const SizedBox(height: 30),
                    CustomTextFormFieled(
                      hitnText: 'Streat',
                      labelText: 'Streat name',
                      sufIcon: Icon(Icons.location_on_outlined),
                      myController: controller.street!,
                      valid: (val) {},
                      isNumber: false,
                    ),
                    const SizedBox(height: 30),

                    CustomTextFormFieled(
                      hitnText: 'name',
                      labelText: ' name',
                      sufIcon: Icon(Icons.person_outline),

                      myController: controller.name!,
                      valid: (val) {},
                      isNumber: false,
                    ),
                    const SizedBox(height: 40),

                    CustomBottunDefault(
                      onTap: () {
                        controller.addAddressDetails();
                      },
                      title: "Add ",
                      color: AppColor.primaryColor,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
