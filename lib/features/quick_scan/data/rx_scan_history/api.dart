import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:genzeh911/features/quick_scan/model/scan_history_model.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class ScannHistoryApi {
  static final ScannHistoryApi _singleton = ScannHistoryApi._internal();
  ScannHistoryApi._internal();
  static ScannHistoryApi get instance => _singleton;

  Future<ScanHistoryModel> scanHistory() async {
    try {
      Response response = await getHttp(Endpoints.scanHistory(),);

      if (response.statusCode == 200) {
        final data = ScanHistoryModel.fromRawJson(json.encode(response.data));
        // NavigationService.navigateToWithArgs(
        //     Routes.scanningReportScreen, {"responseData": response});

        log("==========>scanningReport=========>${data}");
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
