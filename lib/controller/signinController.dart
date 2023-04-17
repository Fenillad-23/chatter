import 'package:chatter/fireabse_config.dart';
import 'package:chatter/route/route_generator.dart';
import 'package:chatter/toast_msg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signin extends GetxController {
  bool obscure = true;
  bool remember = false;
  String msg = '';
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Obscure(bool obscure) {
    obscure = !obscure;
  }

  Remember(bool value) {
    remember = value;
  }

  redirect_to_home() {
    Get.toNamed(RouteGenerator.home);
  }

  void verify_user() {
    if (email.text.isEmail || password.text.length > 4) {
      FirebaseConfig.auth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        Get.offNamed(RouteGenerator.home);
      }).catchError((e) {
        msg = e.message;
        toast(msg);
      });
    }
  }
}
