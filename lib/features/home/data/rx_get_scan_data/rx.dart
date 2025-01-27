import 'package:genzeh911/features/home/data/rx_get_scan_data/api.dart';
import 'package:genzeh911/features/home/model/scan_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class ScanDataRx extends RxResponseInt<ScanModel> {
  final api = ScanDataApi.instance;

  ScanDataRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<ScanModel> scanProductData() async {
    try {
      ScanModel data = await api.scanProductData();
      handleSuccessWithReturn(data);
      return data;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
