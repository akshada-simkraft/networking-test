import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var hiddenPass = true.obs;
}

class RegisterController extends GetxController {
  var hiddenPass = true.obs;
}

class GenderItem {
  String? valueofGender;
  String textToShow;
  GenderItem(this.valueofGender, this.textToShow);
}
