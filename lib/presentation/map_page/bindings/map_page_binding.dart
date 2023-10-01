import 'package:get/get.dart';
import '../controller/map_page_controller.dart';



class MapPageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MapPageController());
  }

}