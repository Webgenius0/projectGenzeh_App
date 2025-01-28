import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:genzeh911/helpers/toast.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class OtpVerifyApi {
  static final OtpVerifyApi _singleton = OtpVerifyApi._internal();
  OtpVerifyApi._internal();
  static OtpVerifyApi get instance => _singleton;

  Future<Map<String, dynamic>> otpVerify({
    required String otp,
  }) async {
    try {
      Map data = {
        "otp": otp,
      };

      Response response = await postHttp(Endpoints.otpVerify(), data);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(json.encode(response.data));
        ToastUtil.showShortToast(data['message']);
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
