import 'package:flutter/material.dart';

final class AuthProvider extends ChangeNotifier {
  //signup
  final TextEditingController name = TextEditingController();
  String displayedHintText = "";
  String selectedCountry = "";

  final TextEditingController country = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  bool isChecked = false;

  final formkey = GlobalKey<FormState>();

  final ValueNotifier<String?> imageFileNotifier = ValueNotifier<String?>(null);

  void toogleCheck(bool value) {
    isChecked = !isChecked;
    notifyListeners();
  }
}
