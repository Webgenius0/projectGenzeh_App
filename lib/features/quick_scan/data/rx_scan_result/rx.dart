import 'dart:io';
import 'package:genzeh911/features/quick_scan/data/rx_scan_result/api.dart';
import 'package:genzeh911/features/quick_scan/data/scan_result_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class ScanResultRx extends RxResponseInt<ScanResultModel> {
  final api = ScanResultApi.instance;

  ScanResultRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> scan({
    required File image,
  }) async {
    try {
      ScanResultModel data = await api.scan(image: image);
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
