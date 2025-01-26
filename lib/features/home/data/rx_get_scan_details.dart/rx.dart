import 'package:genzeh911/features/home/data/rx_get_scan_details.dart/api.dart';
import 'package:genzeh911/features/home/model/history_details_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class ScanDatDetailsaRx extends RxResponseInt<HistoryDetailsModel> {
  final api = ScanDataDetailsApi.instance;

  ScanDatDetailsaRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<HistoryDetailsModel> singleProduct(int id ) async {
    try {
      HistoryDetailsModel data = await api.singleProduct(id);
      handleSuccessWithReturn(data);
      return data;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
