import 'dart:async';
import 'package:ecommerce_cource/core/class/statusRequest.dart';
import 'package:ecommerce_cource/core/constant/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? completercontroller;

  CameraPosition? kGooglePlex;

  Position? position;
  //---marker----
  List<Marker> addMArker = [];
  double? long;
  double? lat;
  addMarkers(LatLng latLang) {
    addMArker.clear();
    addMArker.add(Marker(markerId: MarkerId("1"), position: latLang));
    lat = latLang.longitude;
    long = latLang.latitude;
    update();
  }

  getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );

    addMarkers(LatLng(position.latitude, position.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  goToDetailsAddress() {
    Get.toNamed(
      AppRoutes.detailsAddress,
      arguments: {"lat": lat.toString(), "long": long.toString()},
    );
  }

  @override
  void onInit() {
    completercontroller = Completer<GoogleMapController>();
    getCurrentLocation();

    // TODO: implement onInit
    super.onInit();
  }
}
