import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class editprofile extends GetxController {
  bool obscure = true;
  dynamic gender = TextEditingController();
  Obscure(bool obcure) {
    obscure = !obcure;
  }
}
