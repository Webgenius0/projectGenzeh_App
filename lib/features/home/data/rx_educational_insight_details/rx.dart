import 'package:genzeh911/features/home/data/rx_educational_insight_details/api.dart';
import 'package:genzeh911/features/home/model/single_insight_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class InsightDetailsRx extends RxResponseInt<SingleInsightModel> {
  final api = InsightDetailsApi.instance;

  InsightDetailsRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<SingleInsightModel> insights(int id) async {
    try {
      SingleInsightModel data = await api.insights(id);
      handleSuccessWithReturn(data);
      return data;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
