import 'package:genzeh911/features/account_and_setting/data/rx_profile/api.dart';
import 'package:genzeh911/features/account_and_setting/model/profile_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../networks/rx_base.dart';

final class GetProfileRx extends RxResponseInt<ProfileModel> {
  final api = GetProfileApi.instance;

  GetProfileRx({required super.empty, required super.dataFetcher});

  ValueStream get getProfileData => dataFetcher.stream;

  Future<ProfileModel> getProfile() async {
    try {
      final data = await api.getProfile();

      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
