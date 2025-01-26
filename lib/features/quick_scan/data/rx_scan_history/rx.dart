import 'package:genzeh911/features/quick_scan/data/rx_scan_history/api.dart';
import 'package:genzeh911/features/quick_scan/model/scan_history_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class ScanHistoryRx extends RxResponseInt<ScanHistoryModel> {
  final api = ScannHistoryApi.instance;

  ScanHistoryRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<ScanHistoryModel> scanHistory() async {
    try {
      ScanHistoryModel data = await api.scanHistory();
      handleSuccessWithReturn(data);
      return data;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
