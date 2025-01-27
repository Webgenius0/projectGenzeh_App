import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../networks/dio/dio.dart';
import '../../../../networks/endpoints.dart';
import '../../../../networks/exception_handler/data_source.dart';

final class EditProfileApi {
  static final EditProfileApi _singleton = EditProfileApi._internal();
  EditProfileApi._internal();

  static EditProfileApi get instance => _singleton;

  Future<Map<String, dynamic>> editProfile({
    required String name,
    required String gender,
    required String number,
    required File? imagefile,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "fullname": name,
        "phone": number,
        "gender": gender,
      });

      if (imagefile != null) {
        if (await File(imagefile.path).exists()) {
          data.files.add(
              MapEntry('image', await MultipartFile.fromFile(imagefile.path)));
        }
      }
      Response response = await postHttp(Endpoints.editprofile(), data);

      if (response.statusCode == 200) {
        final data = json.decode(json.encode(response.data));
        return data;
      } else {
        // Handle non-200 status code errors
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      // Handle generic errors
      throw ErrorHandler.handle(error).failure.responseMessage;
    }
  }
}
