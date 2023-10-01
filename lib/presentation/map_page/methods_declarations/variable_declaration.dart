import 'package:get/get.dart';
import 'package:uber_clone/core/utils/reponse_handle.dart';
import '../model/autocomplete_places_api.dart';
import '../model/google_map_model.dart';
import '../repository/map_page_repository.dart';

class VariableDeclaration {
  final MapPageRepository _mapPageRepository = MapPageRepository();

  RxString directions = "".obs;
  var desc = <Predictions>[].obs;
  Rx<Predictions> descObj = Predictions().obs;

  Future<void> getGoogleMapDirections(
      String origin, String destination, String key) async {
    try {
      ResponseHandle<MapModel> googleResponse = await _mapPageRepository
          .getGoogleMapDirectionsApi(origin, destination, key);
      if (googleResponse.statusCode == '1') {
        throw Exception("There is Error In Fetching Google Directions Api");
      } else {
        if (googleResponse.data.routes!.isEmpty ||
            googleResponse.data.geocodedWaypoints!.isEmpty ||
            googleResponse.data.status == "") {
          throw Error();
        } else {
          directions.value =
              googleResponse.data.routes![0].legs![0].distance.toString();
        }
      }
    } catch (e) {
      String errormsg = "Error in Catch Block$e";
      throw Exception(errormsg);
    }
  }

  Future<void> getGoogleAutocompletePlace(
      String input, String geocode, String key) async {
    try {
      ResponseHandle<AutocompleteModel> googleAutoResponse =
          await _mapPageRepository.getAutocompletePlacesApi(
              input, geocode, key);
      if (googleAutoResponse.statusCode == '1') {
        throw Exception("There is Error In Fetching Google Places Api");
      } else {
        if (googleAutoResponse.data.predictions!.isEmpty ||
            googleAutoResponse.data.status == "") {
          throw Error();
        } else {
          desc.addAll(googleAutoResponse.data.predictions!);

          for (var h in desc) {
            descObj.value = h;
          }

        }
      }
    } catch (e) {
      String errormsg = "Error in Catch Block$e";
      throw Exception(errormsg);
    }
  }
}
