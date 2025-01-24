import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:genzeh911/features/quick_scan/data/scan_result_model.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class ScanResultApi {
  static final ScanResultApi _singleton = ScanResultApi._internal();
  ScanResultApi._internal();
  static ScanResultApi get instance => _singleton;

  Future<ScanResultModel> scan({
    required File image,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "image": image,
      });

      if (await File(image.path).exists()) {
        data.files
            .add(MapEntry('image', await MultipartFile.fromFile(image.path)));
      }

      Response response = await postHttp(Endpoints.scan(), data);

      if (response.statusCode == 200) {
        final data = ScanResultModel.fromRawJson(json.encode(response.data));
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
      // throw ErrorHandler.handle(error).failure.responseMessage;
      rethrow;
    }
  }
}
