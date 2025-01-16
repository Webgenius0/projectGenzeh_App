import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:genzeh911/constants/app_constants.dart';
import 'package:genzeh911/features/auth/model/signup_model.dart';
import 'package:genzeh911/helpers/di.dart';
import 'package:genzeh911/helpers/toast.dart';
import 'package:genzeh911/networks/dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class SignupRx extends RxResponseInt<SignupModel> {
  final api = SignupApi.instance;

  SignupRx({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<bool> signup({
    required String name,
    required String dateofbirth,
    required String country,
    required String username,
    required String email,
    required File image,
    required String password,
  }) async {
    try {
      SignupModel data = await api.signup(
          name: name,
          dateofbirth: dateofbirth,
          country: country,
          username: username,
          email: email,
          image: image,
          password: password);
      handleSuccessWithReturn(data);
      return true;
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(dynamic data) async {
    SignupModel signupResponse = data;

    String accessToken = signupResponse.token!;

    await appData.write(kKeyIsLoggedIn, true);
    await appData.write(kKeyAccessToken, accessToken);

    String token = appData.read(kKeyAccessToken);
    dataFetcher.sink.add(signupResponse);

    DioSingleton.instance.update(token);
    dataFetcher.sink.add(signupResponse);
    return signupResponse;
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
