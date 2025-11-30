import 'package:ecommerce_cource/controller/orders/archive_controller.dart';
import 'package:ecommerce_cource/controller/orders/orders_pendding_controllers.dart';
import 'package:ecommerce_cource/core/constant/colors.dart';
import 'package:ecommerce_cource/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rating_dialog/rating_dialog.dart';

// show the dialog function
void showRatingDialog(BuildContext context, String ordersID) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(AppImageAsset.logo, width: 200, height: 200),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ArchiveOrdersController archiveOrdersController = Get.find();
        archiveOrdersController.submetRating(
          ordersID,
          response.rating,
          response.comment,
        );
          },
    ),
  );
}
