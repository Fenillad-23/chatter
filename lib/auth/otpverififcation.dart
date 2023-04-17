import 'package:chatter/auth/resetpassword.dart';
import 'package:chatter/auth/signin.dart';
import 'package:chatter/color/AppColor.dart';
import 'package:chatter/controller/forgotpasswordcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../widget/TextView.dart';
import '../widget/appBar.dart';
import '../widget/primaryButton.dart';

class OTPverification extends StatefulWidget {
  const OTPverification({super.key});

  @override
  State<OTPverification> createState() => _OTPverificationState();
}

class _OTPverificationState extends State<OTPverification> {
  forgotpassword controller = Get.put(forgotpassword());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: Appbar('Enter Otp', AppColors.primaryText, true,
          AppColors.appBackground, false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 50),
                child: Row(children: [
                  Expanded(
                      child: TextView('Enter Verification\nCode',
                          fontWeight: FontWeight.w700, fontSize: 32)),
                ])),
            Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 24, right: 98),
                child: TextView(
                    'Please enter the OTP received by your registered\nEmail Id',
                    fontSize: 16,
                    textColor: AppColors.lightText)),
            Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 36, right: 25),
                child: OTPTextField(
                    controller: controller.otp,
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 70,
                    fieldStyle: FieldStyle.box,
                    otpFieldStyle: OtpFieldStyle(
                        backgroundColor: AppColors.primaryTextField),
                    outlineBorderRadius: 12,
                    style: TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    })),
            Padding(
                padding: const EdgeInsets.only(top: 172.0, left: 24, right: 24),
                child: primaryButton(380, 60, Colors.transparent, () {
                  Get.to(
                    ResetPassword());
                }, 'Submit', AppColors.secondaryText, 28)),
            Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(SignIn(),
                        transition: Transition.fadeIn,
                        duration: Duration(seconds: 2));
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextView('Remembered Password?',
                            fontSize: 20, fontWeight: FontWeight.w400),
                        TextView('Sign In',
                            textColor: Colors.purpleAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.w500)
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}
