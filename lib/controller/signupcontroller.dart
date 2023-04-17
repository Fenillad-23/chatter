import 'package:chatter/fireabse_config.dart';
import 'package:chatter/route/route_generator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../toast_msg.dart';

class signup extends GetxController {
  bool obscure = true;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  String img = 'assets/icons/user_icon.png';
  String msg = '';
  dynamic gender = TextEditingController();
  Obscure(bool obscure) {
    obscure = !obscure;
  }

  void verify_user_data() async {
    if (email.text.isEmail ||
        password.text.length > 4 ||
        name.text.isNotEmpty) {
      FirebaseConfig.auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        User? user = FirebaseConfig.auth.currentUser;
        Map<String, dynamic> userdata = {
          'email': email.text,
          'img': img,
          'uid': user!.uid,
          'username': name.text
        };
        FirebaseConfig.storage
            .collection('user')
            .doc(user.uid)
            .set(userdata)
            .then((value) {
          Get.offNamed(RouteGenerator.home);
        }).catchError((e) {
          msg = e.message;
          toast(msg);
        });
      }).catchError((e) {
        msg = e.message;
        toast(msg);
      });
    }
  }
}
