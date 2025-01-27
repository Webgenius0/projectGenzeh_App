import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:genzeh911/features/home/model/insight_model.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class InsightApi {
  static final InsightApi _singleton = InsightApi._internal();
  InsightApi._internal();
  static InsightApi get instance => _singleton;

  Future<InsightModel> insights() async {
    try {
      Response response = await getHttp(Endpoints.insights());

      if (response.statusCode == 200) {
        InsightModel data =
            InsightModel.fromRawJson(json.encode(response.data));

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
