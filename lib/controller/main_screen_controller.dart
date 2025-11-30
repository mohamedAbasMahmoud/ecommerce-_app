import 'package:ecommerce_cource/view/screen/bottom_appbar_screen.dart/notifications_screen.dart';
import 'package:ecommerce_cource/view/screen/bottom_appbar_screen.dart/offers_screen.dart';
import 'package:ecommerce_cource/view/screen/bottom_appbar_screen.dart/settings_screen.dart';
import 'package:ecommerce_cource/view/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  //screens------------
  List<Widget> listPage = [
    const HomePage(),

    const Notifications(),
    const OffersScreen(),
    const Settings(),
  ];
  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "n", "icon": Icons.notifications_active_outlined},
    {
      "title": "offers", "icon": Icons.local_offer, // أيقونة العروض
    },
    {"title": "settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
