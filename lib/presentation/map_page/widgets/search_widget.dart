import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/map_page_controller.dart';
import '../methods_declarations/common_methods.dart';


Widget searchPlaces(BuildContext context) {
  var controller = Get.put(MapPageController());
  CommonMethods commonMethods=CommonMethods();
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: TextField(
        
        controller: controller.searchController,
        onChanged: (value) {
         commonMethods.onChangedTextField(value);
        },
        cursorColor: Colors.black,
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.search,color: Colors.black,size: 25,),
            isDense: true,
            contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 4),
            border: InputBorder.none),
      ),
    ),
  );
}
