import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:genzeh911/features/home/model/scan_model.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class ScanDataApi {
  static final ScanDataApi _singleton = ScanDataApi._internal();
  ScanDataApi._internal();
  static ScanDataApi get instance => _singleton;

  Future<ScanModel> scanProductData() async {
    try {
      Response response = await getHttp(Endpoints.scanProductData());

      if (response.statusCode == 200) {
        ScanModel data =
            ScanModel.fromRawJson(json.encode(response.data));

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
