import 'package:genzeh911/features/auth/data/rx_login/api.dart';
import 'package:genzeh911/features/auth/model/onboard_model.dart';

import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';

final class OnboardRx extends RxResponseInt<OnboardModel> {
  final api = OnboardApi.instance;

  OnboardRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> Login({
    required String old,
    required String findus,
    required String maingoal,
  }) async {
    try {
      OnboardModel data =
          await api.onboard(old: old, findus: findus, maingoal: maingoal);
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
