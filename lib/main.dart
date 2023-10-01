import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uber_clone/routes/app_routes.dart';
import 'core/utils/initial_bindings.dart';




void main() {
  runApp(const UberAppRoot());
}

class UberAppRoot extends StatelessWidget {
  const UberAppRoot({super.key});

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'uber-clone',
      initialBinding: InitialBindings(),
      initialRoute: MainRouting.initialRoute,
      getPages: MainRouting.pages,
    );
  }

}
