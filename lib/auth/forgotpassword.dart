import 'package:chatter/auth/otpverififcation.dart';
import 'package:chatter/auth/signin.dart';
import 'package:chatter/color/AppColor.dart';
import 'package:chatter/controller/forgotpasswordcontroller.dart';
import 'package:chatter/widget/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/EditText.dart';
import '../widget/TextView.dart';
import '../widget/primaryButton.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  forgotpassword controller = Get.put(forgotpassword());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: Appbar('Forgot Password', AppColors.primaryText, true,
            AppColors.appBackground, true),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 24.0, top: 50),
                        child: Row(children: [
                          Expanded(
                              child: TextView('Did you Forgot\nthe Password?',
                                  fontWeight: FontWeight.w700, fontSize: 32)),
                        ])),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, left: 24, right: 98),
                        child: TextView(
                            'Please fill email to get verification code',
                            fontSize: 16,
                            textColor: AppColors.lightText)),
                    Padding(
                        padding: EdgeInsets.only(top: 36, left: 24, right: 24),
                        child: EditText(
                            controller: controller.emailverificationController,
                            fontSize: 16,
                            filled: true,
                            hint: 'Enter Email Address',
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: Colors.grey.shade500,
                            ),
                            border: InputBorder.none,
                            showRectangularInputBorder: true,
                            borderRadius: 12,
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            fillColor: AppColors.primaryTextField)),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 172.0, left: 24, right: 24),
                        child: primaryButton(380, 60, Colors.transparent, () {
                          Get.to(
                            OTPverification(),
                          );
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
                  ]),
            )));
  }
}
