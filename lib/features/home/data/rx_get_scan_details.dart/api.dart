import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:genzeh911/features/home/model/history_details_model.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class ScanDataDetailsApi {
  static final ScanDataDetailsApi _singleton = ScanDataDetailsApi._internal();
  ScanDataDetailsApi._internal();
  static ScanDataDetailsApi get instance => _singleton;

  Future<HistoryDetailsModel> singleProduct(int id) async {
    try {
      Response response = await getHttp(Endpoints.singleProduct(id));

      if (response.statusCode == 200) {
        HistoryDetailsModel data =
            HistoryDetailsModel.fromRawJson(json.encode(response.data));

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
