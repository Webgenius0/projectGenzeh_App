import 'package:genzeh911/features/auth/data/rx_onboard/api.dart';
import 'package:genzeh911/features/auth/model/onboard_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class OnboardRx extends RxResponseInt<OnboardModel> {
  final api = OnboardApi.instance;

  OnboardRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<OnboardModel> onboard({
    required String old,
    required String findus,
    required String maingoal,
  }) async {
    try {
      OnboardModel data =
          await api.onboard(old: old, findus: findus, maingoal: maingoal);
      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
