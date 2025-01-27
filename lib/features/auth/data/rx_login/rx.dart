import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:genzeh911/constants/app_constants.dart';
import 'package:genzeh911/features/auth/model/login_model.dart';
import 'package:genzeh911/helpers/di.dart';
import 'package:genzeh911/helpers/toast.dart';
import 'package:genzeh911/networks/dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class LoginRx extends RxResponseInt<LoginModel> {
  final api = LoginApi.instance;

  LoginRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> Login({
    required String email,
    required String password,
  }) async {
    try {
      LoginModel data = await api.Login(email: email, password: password);
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(dynamic data) async {
    LoginModel loginModel = data;

    String accessToken = loginModel.token!;

    await appData.write(kKeyIsLoggedIn, true);
    await appData.write(kKeyAccessToken, accessToken);

    String token = appData.read(kKeyAccessToken);
    dataFetcher.sink.add(loginModel);

    DioSingleton.instance.update(token);
    dataFetcher.sink.add(loginModel);
    return loginModel;
  }

  @override
  handleErrorWithReturn(dynamic error) {
    if (error is DioException) {
      if (error.response!.statusCode == 401) {
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
