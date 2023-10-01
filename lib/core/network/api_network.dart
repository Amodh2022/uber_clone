import 'dart:convert';
import 'package:get/get.dart';
import 'package:uber_clone/core/network/progress_dialog_utils.dart';
import 'exceptions.dart';
import 'logger.dart';
import 'network_info.dart';
import 'package:http/http.dart' as http;




class ApiNetwork{
  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  Future<dynamic> get(String url, [Map<String, String>? headers]) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      if (headers == null || headers.isEmpty) {
        headers = {'Content-Type': 'application/json'};
      }
      await isNetworkConnected();
      final response = await http.get(Uri.parse(url), headers: headers);
      ProgressDialogUtils.hideProgressDialog();
      var responseJson = _response(response);
      return responseJson;
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
    }
  }

  Future<dynamic> getMapPage(String url, [Map<String, String>? headers]) async {
    //ProgressDialogUtils.showProgressDialog();
    try {
      if (headers == null || headers.isEmpty) {
        headers = {'Content-Type': 'application/json'};
      }
      await isNetworkConnected();
      final response = await http.get(Uri.parse(url), headers: headers);
      //ProgressDialogUtils.hideProgressDialog();
      var responseJson = _response(response);
      return responseJson;
    } catch (error, stackTrace) {
      // ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
    }
  }

  Future<dynamic> postNoLoad(String url, dynamic body1,
      [Map<String, String>? headers]) async {
    try {
      await isNetworkConnected();
      final uri = Uri.parse(url);
      if (headers == null || headers.isEmpty) {
        headers = {'Content-Type': 'application/json'};
      }

      String body = json.encode(body1);

      var response = await http.post(uri, headers: headers, body: body);

      return _response(response);
    } catch (error, stackTrace) {
      Logger.log(error, stackTrace: stackTrace);
    }
  }

  Future<dynamic> post(String url, dynamic body1,
      [Map<String, String>? headers]) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      final uri = Uri.parse(url);
      if (headers == null || headers.isEmpty) {
        headers = {'Content-Type': 'application/json'};
      }

      String body = json.encode(body1);

      var response = await http.post(uri, headers: headers, body: body);
      ProgressDialogUtils.hideProgressDialog();
      return _response(response);
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
    }
  }

  Future<dynamic> postPNoLoad(String url, {Map<String, String>? headers, Map<String, dynamic>? parameters}) async {
    try {
      await isNetworkConnected();
      final uri = Uri.parse(url);

      if (headers == null || headers.isEmpty) {
        headers = {'Content-Type': 'application/json'};
      }

      var response = await http.post(uri, headers: headers, body: json.encode(parameters));

      return _response(response);
    } catch (error, stackTrace) {
      Logger.log(error, stackTrace: stackTrace);
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw Exception("Error 400");
      case 401:
        throw Exception("Error 401");
      case 403:
        throw Exception("Error 403");
      case 500:
        throw Exception("Error 500");

      default:
        throw ServerException();
    }
  }
}

