import 'package:get/get.dart';
import 'package:uber_clone/presentation/map_page/controller/map_page_controller.dart';


class CommonMethods{
  var controller=Get.put(MapPageController());


  void onChangedTextField(value){
    if (controller.searchController.text != "") {
      controller.showList.value=true;
      controller.variableDeclaration.getGoogleAutocompletePlace(
          value, "geocode", controller.googleApiKey.value);
    }else if(controller.searchController.text == ""){
      controller.showList.value=false;
    }
    controller.variableDeclaration.desc.clear();
  }



}