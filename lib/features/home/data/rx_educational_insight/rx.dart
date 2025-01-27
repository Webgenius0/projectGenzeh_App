import 'package:genzeh911/features/home/data/rx_educational_insight/api.dart';
import 'package:genzeh911/features/home/model/insight_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class InsightRx extends RxResponseInt<InsightModel> {
  final api = InsightApi.instance;

  InsightRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<InsightModel> insights() async {
    try {
      InsightModel data = await api.insights();
      handleSuccessWithReturn(data);
      return data;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
