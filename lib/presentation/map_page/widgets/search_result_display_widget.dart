import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/map_page_controller.dart';

Widget searchResultsBuilder(BuildContext context) {
  var controller = Get.put(MapPageController());
  return Obx(() => Visibility(
        visible: controller.showList.value,
        child: AnimatedContainer(
          height: 200,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          duration: const Duration(seconds: 10),
          child: ListView.builder(
            shrinkWrap: true,
              itemCount: controller.variableDeclaration.desc.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const Icon(Icons.pin_drop),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(controller
                            .variableDeclaration.desc[index].description!),
                      ),
                    )
                  ],
                );
              }),
        ),
      ));
}
