import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:genzeh911/features/home/model/single_insight_model.dart';

import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class InsightDetailsApi {
  static final InsightDetailsApi _singleton = InsightDetailsApi._internal();
  InsightDetailsApi._internal();
  static InsightDetailsApi get instance => _singleton;

  Future<SingleInsightModel> insights(int id) async {
    try {
      Response response = await getHttp(Endpoints.insightDetails(id));

      if (response.statusCode == 200) {
        SingleInsightModel data =
            SingleInsightModel.fromRawJson(json.encode(response.data));

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
