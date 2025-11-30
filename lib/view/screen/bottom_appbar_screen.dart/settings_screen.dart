import 'package:ecommerce_cource/controller/settings_controller.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/constant/imageasset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 3, color: AppColor.primaryColor),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    // onTap: () {},
                    trailing: Switch(onChanged: (val) {}, value: true),
                    title: Text("Disable Notificatios"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.waitingorders);
                    },
                    trailing: Icon(Icons.local_shipping),
                    title: Text("Orders Waiting"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.archiveOrders);
                    },
                    trailing: Icon(Icons.archive),
                    title: Text("Archive"),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.detailsAddress);
                    },
                    trailing: Icon(Icons.location_on_outlined),
                    title: Text("Address"),
                  ), //

                  ListTile(
                    onTap: () {},
                    trailing: Icon(Icons.help_outline_rounded),
                    title: Text("About us"),
                  ),
                  ListTile(
                    onTap: () async{
                   await   launchUrl(Uri.parse("tel:+01094399597"));
                    },
                    trailing: Icon(Icons.phone_callback_outlined),
                    title: Text("Contact us"),
                  ),
                  ListTile(
                    onTap: () {
                      settingsController.logout();
                    },
                    title: Text("Logout"),
                    trailing: Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
