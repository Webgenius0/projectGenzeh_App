import 'package:genzeh911/networks/rx_base.dart';
import 'package:rxdart/rxdart.dart';
import 'api.dart';

final class RatingRx extends RxResponseInt {
  final api = RatingApi.instance;

  RatingRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> otpVerify({
    required int rating,
    required String comment,
  }) async {
    try {
      Map data = await api.rating(rating: rating, comment: comment);

      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
