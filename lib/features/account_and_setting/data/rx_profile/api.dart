import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:genzeh911/features/account_and_setting/model/profile_model.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class GetProfileApi {
  static final GetProfileApi _singleton = GetProfileApi._internal();
  GetProfileApi._internal();

  static GetProfileApi get instance => _singleton;

  Future<ProfileModel> getProfile() async {
    try {
      Response response = await getHttp(Endpoints.profile());

      if (response.statusCode == 200) {
        final data = ProfileModel.fromRawJson(json.encode(response.data));
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
