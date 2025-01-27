import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class OtpSendApi {
  static final OtpSendApi _singleton = OtpSendApi._internal();
  OtpSendApi._internal();
  static OtpSendApi get instance => _singleton;

  Future<Map<String, dynamic>> otpSend({
    required String email,
  }) async {
    try {
      Map data = {
        "email": email,
      };

      Response response = await postHttp(Endpoints.otpSend(), data);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      // throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}
