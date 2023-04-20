import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class editprofile extends GetxController {
  bool obscure = true;
  final box = GetStorage();
  dynamic gender = TextEditingController();
  Obscure(bool obcure) {
    obscure = !obcure;
  }
}
