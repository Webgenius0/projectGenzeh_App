import 'package:rxdart/rxdart.dart';

import '../../../../../networks/rx_base.dart';
import 'api.dart';

final class GetLogoutResponseRX extends RxResponseInt {
  final api = LogoutApi.instance;

  GetLogoutResponseRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<void> logout() async {
    try {
      Map data = await api.logout();
      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
