import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controller/map_page_controller.dart';





Widget mapWidget(BuildContext context){
  var controller=Get.put(MapPageController());
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Obx(() => GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      compassEnabled: true,
      initialCameraPosition: CameraPosition(
          target:controller.targetLocation.value
      ),
      onMapCreated: (myMap) {
        controller.mapController.value.complete(myMap);
      },

    )),
  );
}