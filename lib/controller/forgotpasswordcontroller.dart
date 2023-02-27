import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:otp_text_field/otp_field.dart';

class forgotpassword extends GetxController {
  TextEditingController emailverificationController = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  OtpFieldController otp = OtpFieldController();
  bool obscure = true;
  Obscure(bool obcure) {
    obscure = !obcure;
  }
}
