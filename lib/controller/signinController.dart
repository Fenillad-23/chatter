import 'package:chatter/fireabse_config.dart';
import 'package:chatter/model/user.dart';
import 'package:chatter/route/route_generator.dart';
import 'package:chatter/toast_msg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class signin extends GetxController {
  bool obscure = true;
  bool remember = false;
  Rx<Userdata>? data;
  String msg = '';
  final box = GetStorage();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    check_auth();
  }

  Future<void> check_auth() async {
    if (box.read('email') != null) {
      Future.delayed(Duration(seconds: 2), () {
        Get.offNamed(RouteGenerator.home);
      });
    }
  }

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
      try {
        FirebaseConfig.auth
            .signInWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) async {
          await FirebaseConfig.storage
              .collection('user')
              .where('email', isEqualTo: email.text)
              .get()
              .then((snapshot) async {
            for (var snap in snapshot.docs) {
              data = await Userdata.fromJson(snap.data()).obs;
              box.write('email', email.text);
              box.write('username', data!.value.username);
              box.write('img', data!.value.img);
              box.write('uid', data!.value.uid);
            }
          });
          Get.offNamed(RouteGenerator.home);
        }).catchError((e) {
          msg = e.message;
          toast(msg);
        });
      } catch (Exception) {
        msg = Exception.toString();
        toast(msg);
      }
    }
  }
}
