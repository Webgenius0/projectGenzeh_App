import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:genzeh911/networks/dio/dio.dart';
import 'package:genzeh911/networks/endpoints.dart';
import 'package:genzeh911/networks/exception_handler/data_source.dart';

final class RatingApi {
  static final RatingApi _singleton = RatingApi._internal();
  RatingApi._internal();
  static RatingApi get instance => _singleton;

  Future<Map<String, dynamic>> rating({
    required int rating,
    required String comment,
  }) async {
    try {
      Map data = {
        "rating": rating,
        "comment": comment
      };

      Response response = await postHttp(Endpoints.rating(), data);

      if (response.statusCode == 201) {
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
