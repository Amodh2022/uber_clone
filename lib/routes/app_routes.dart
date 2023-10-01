import 'package:get/get_navigation/src/routes/get_route.dart';
import '../presentation/map_page/bindings/map_page_binding.dart';
import '../presentation/map_page/map_main_screen.dart';




class MainRouting{
  static String initialRoute = '/initialRoute';
  static String splashScreen = '/splash_screen';


  static List<GetPage> pages=[

    GetPage(
      name: initialRoute,
      page: () => const MapMainScreen(),
      bindings: [
        MapPageBindings(),
      ],
    ),




  ];

}