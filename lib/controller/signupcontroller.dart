import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signup extends GetxController {
  bool obscure = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  dynamic gender = TextEditingController();
  Obscure(bool obcure) {
    obscure = !obcure;
  }
}
