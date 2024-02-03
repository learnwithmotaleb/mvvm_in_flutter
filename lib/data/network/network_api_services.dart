import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mvvm/data/App_Exception/Apps_Exception.dart';
import 'package:mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {


  @override
  Future getApi(String url) async {

    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOutException {
      throw RequestTimeOutException();
    }

    return responseJson;
  }


  @override
  Future postApi(var data,String url) async {

    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;

    try {
      final response =
      await http.post(
        Uri.parse(url),
        // body: jsonEncode(data),//with raw from data
        body: data, //without raw from data
      ).timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOutException {
      throw RequestTimeOutException();
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }





  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw InvalidURLException;
      default:
        throw FetchDataException("Error while communication Status Code: ${response.statusCode.toString()}");
    }
  }
}
