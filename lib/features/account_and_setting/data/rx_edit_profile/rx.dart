import 'dart:io';
import 'package:rxdart/rxdart.dart';
import '../../../../networks/rx_base.dart';
import 'api.dart';

final class GetEditProfileResponseRX extends RxResponseInt {
  final api = EditProfileApi.instance;

  GetEditProfileResponseRX({required super.empty, required super.dataFetcher});

  ValueStream get getFileData => dataFetcher.stream;

  Future<void> editProfile({
    required String name,
    required String gender,
    required String number,
    required File? avaterImage,
        required String? date,

  }) async {
    try {
      Map data = await api.editProfile(
          name: name, gender: gender, number: number, imagefile: avaterImage,date: date);
      return handleSuccessWithReturn(data);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
