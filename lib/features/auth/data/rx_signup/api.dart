import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:genzeh911/features/auth/model/signup_model.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class SignupApi {
  static final SignupApi _singleton = SignupApi._internal();
  SignupApi._internal();
  static SignupApi get instance => _singleton;

  Future<SignupModel> signup({
    required String name,
    required String dateofbirth,
    required String country,
    required String username,
    required String email,
    required File image,
    required String password,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "fullname": name,
        "date_of_birth": dateofbirth,
        "country": country,
        "username": username,
        "email": email,
        "password": password,
      });

      if (await File(image.path).exists()) {
        data.files
            .add(MapEntry('image', await MultipartFile.fromFile(image.path)));
      }

      Response response = await postHttp(Endpoints.signup(), data);

      if (response.statusCode == 201) {
        final data = SignupModel.fromRawJson(json.encode(response.data));
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
