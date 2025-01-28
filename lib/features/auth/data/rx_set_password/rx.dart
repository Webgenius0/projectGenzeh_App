import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:genzeh911/helpers/toast.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class SetPasswordRx extends RxResponseInt {
  final api = SetPasswordApi.instance;

  SetPasswordRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> setPassword({
    required String email,
    required String password,
  }) async {
    try {
      Map data = await api.setPassword(email: email, password: password);
      ToastUtil.showShortToast(data['message']);

      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 422) {
        ToastUtil.showShortToast(error.response!.data["message"]);
      } else {
        ToastUtil.showShortToast(error.response!.data["message"]);
      }
    }
    log(error.toString());
    dataFetcher.sink.addError(error);
    // throw error;
    return false;
  }
}
