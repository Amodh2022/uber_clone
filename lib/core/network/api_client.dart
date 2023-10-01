import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uber_clone/core/network/progress_dialog_utils.dart';
import 'exceptions.dart';
import 'logger.dart';
import 'network_info.dart';


class ApiClient extends GetConnect {
  var baseURL = "";

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.addRequestModifier<dynamic>((request) {
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: "application/json"
      };
      request.headers.addAll(headers);
      return request;
    });
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  /// user can modify this method with custom logics based on their API response


  //  login
  Future loginFromJavaApi(
      {Function(dynamic data)? onSuccess,
        Function(dynamic error)? onError,
        Map<String, String> headers = const {},
        Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();

    try {
      await isNetworkConnected();
      String apiUrl = '$baseURL/fineract-provider/api/v1/authentication';
      final response = await http.post(Uri.parse(apiUrl),
          headers: headers, body: json.encode(requestData));
      ProgressDialogUtils.hideProgressDialog();
      if (response.statusCode == 200) {
        onSuccess!(jsonDecode(response.body));

      } else {
        onError!(
          'Something Went Wrong!',
        );
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(error, stackTrace: stackTrace);
      onError!(error);
    }
  }
}
