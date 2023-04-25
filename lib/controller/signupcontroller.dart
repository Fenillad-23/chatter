import 'package:chatter/fireabse_config.dart';
import 'package:chatter/route/route_generator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/user.dart';
import '../toast_msg.dart';

class signup extends GetxController {
  bool obscure = true;
  final box = GetStorage();
  Rx<Userdata>? data;
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
      try {
        FirebaseConfig.auth
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) {
          User? user = FirebaseConfig.auth.currentUser;
          data = Userdata(email.text, img, user!.uid, name.text).obs;
          Map<String, dynamic>? userdata = data?.toJson();
          FirebaseConfig.storage
              .collection('user')
              .doc(user.uid)
              .set(userdata!)
              .then((value) {
            box.write('email', email.text);
            box.write('uid', user.uid);
            box.write('username', name.text);
            box.write('img', img);
            Get.offNamed(RouteGenerator.home);
          }).catchError((e) {
            msg = e.message;
            toast(msg);
          });
        }).catchError((e) {
          msg = e.message;
          toast(msg);
        });
      } catch (exception) {
        msg = exception.toString();
        toast(msg);
      }
    }
  }
}
