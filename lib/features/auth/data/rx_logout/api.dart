import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class LogoutApi {
  static final LogoutApi _singleton = LogoutApi._internal();
  LogoutApi._internal();
  static LogoutApi get instance => _singleton;

  Future<Map> logout() async {
    try {
      Response response = await postHttp(Endpoints.logout());

      if (response.statusCode == 200) {
        Map data = json.decode(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure.responseMessage;
    }
  }
}
