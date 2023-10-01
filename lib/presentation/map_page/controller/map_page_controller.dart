import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../methods_declarations/common_methods.dart';
import '../methods_declarations/variable_declaration.dart';

class MapPageController extends GetxController {
  ///Instance of Methods class
  VariableDeclaration variableDeclaration = VariableDeclaration();

  ///Completer for The Map Controller
  Rx<Completer<GoogleMapController>> mapController =
      Completer<GoogleMapController>().obs;

  ///LatLang For Target Location
  Rx<LatLng> targetLocation = const LatLng(12.9296041242, 77.5802671909).obs;

  RxString googleApiKey = "AIzaSyD0kD8-hmW12kmXHI-uoUMGgK5nVoGH-4c".obs;

  TextEditingController searchController = TextEditingController();

  RxBool showList = false.obs;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() async {
    super.onInit();
    _determinePosition();
    // variableDeclaration.getGoogleMapDirections(const LatLng(12.9296041242, 77.5802671909).toString(), const LatLng(12.9273702773, 77.577547431).toString(), "AIzaSyD0kD8-hmW12kmXHI-uoUMGgK5nVoGH-4c");
  }
}
