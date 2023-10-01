import 'package:uber_clone/core/utils/reponse_handle.dart';

import '../../../core/network/api_network.dart';
import '../../../core/url/url.dart';
import '../model/autocomplete_places_api.dart';
import '../model/google_map_model.dart';

class MapPageRepository {
  final ApiNetwork _apiNetwork = ApiNetwork();

  ///Get Google Maps Api
  Future<ResponseHandle<MapModel>> getGoogleMapDirectionsApi(String origin, String destination, String key) async {
    try {
      String url =
          "$UberCloneUrl?origin=$origin&destination=$destination&key=$key";

      final response = await _apiNetwork.postNoLoad(url,"NA");

      MapModel res = MapModel.fromJson(response);

      ResponseHandle<MapModel> resq = ResponseHandle("0", res, "success");
      return resq;
    } catch (e) {
      String errormsg = "Error in Catch Block$e";
      ResponseHandle<MapModel> resq = ResponseHandle.withoutdata("1", errormsg);
      return resq;
    }
  }



  Future<ResponseHandle<AutocompleteModel>> getAutocompletePlacesApi(String input, String geocode, String key) async {
    try {
      String url =
          "${UberCloneUrl.autocompletePlacesApi}?input=$input&geocode=$geocode&key=$key";

      final response = await _apiNetwork.postNoLoad(url,"NA");

      AutocompleteModel res = AutocompleteModel.fromJson(response);

      ResponseHandle<AutocompleteModel> resq = ResponseHandle("0", res, "success");
      return resq;
    } catch (e) {
      String errormsg = "Error in Catch Block$e";
      ResponseHandle<AutocompleteModel> resq = ResponseHandle.withoutdata("1", errormsg);
      return resq;
    }
  }
}
