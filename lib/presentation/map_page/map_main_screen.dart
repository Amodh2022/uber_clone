import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_clone/presentation/map_page/widgets/map_widget.dart';
import 'package:uber_clone/presentation/map_page/widgets/search_result_display_widget.dart';
import 'package:uber_clone/presentation/map_page/widgets/search_widget.dart';
import 'controller/map_page_controller.dart';



class MapMainScreen extends GetWidget<MapPageController> {
  const MapMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

             mapWidget(context),
            Positioned(
              top: 40,
                child: searchPlaces(context)),
            Positioned(
              top: 85,
                left: 10,
                right: 10,
                child: searchResultsBuilder(context)),

          ],
        ),
      ),
    );
  }
}
