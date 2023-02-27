import 'package:chatter/auth/signin.dart';
import 'package:chatter/widget/EditText.dart';
import 'package:chatter/widget/appBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../color/AppColor.dart';
import '../controller/forgotpasswordcontroller.dart';
import '../widget/TextView.dart';
import '../widget/primaryButton.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  forgotpassword controller = Get.put(forgotpassword());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: Appbar('Create Password', AppColors.primaryText, true,
            AppColors.appBackground, false),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 50),
                child: Row(children: [
                  Expanded(
                      child: TextView('Create new\npassword',
                          fontWeight: FontWeight.w700, fontSize: 32)),
                ])),
            Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 24, right: 98),
                child: TextView(
                    'Create a strong password to login in to the account',
                    fontSize: 16,
                    textColor: AppColors.lightText)),
            Padding(
                padding: EdgeInsets.only(top: 32, left: 24, right: 24),
                child: EditText(
                    controller: controller.newpassword,
                    fontSize: 16,
                    obscureText: controller.obscure,
                    filled: true,
                    hint: 'Create Password',
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                      color: Colors.grey.shade500,
                    ),
                    suffixIcon: controller.obscure
                        ? IconButton(
                            icon: Icon(Icons.visibility_rounded),
                            onPressed: () {
                              setState(() {
                                controller.Obscure(controller.obscure);
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.visibility_off_rounded),
                            onPressed: () {
                              setState(() {
                                controller.Obscure(controller.obscure);
                              });
                            },
                          ),
                    border: InputBorder.none,
                    showRectangularInputBorder: true,
                    borderRadius: 12,
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    fillColor: AppColors.primaryTextField)),
            Padding(
                padding: EdgeInsets.only(top: 32, left: 24, right: 24),
                child: EditText(
                    controller: controller.newpassword,
                    fontSize: 16,
                    obscureText: controller.obscure,
                    filled: true,
                    hint: 'Confirm Password',
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                      color: Colors.grey.shade500,
                    ),
                    suffixIcon: controller.obscure
                        ? IconButton(
                            icon: Icon(Icons.visibility_rounded),
                            onPressed: () {
                              setState(() {
                                controller.Obscure(controller.obscure);
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.visibility_off_rounded),
                            onPressed: () {
                              setState(() {
                                controller.Obscure(controller.obscure);
                              });
                            },
                          ),
                    border: InputBorder.none,
                    showRectangularInputBorder: true,
                    borderRadius: 12,
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    fillColor: AppColors.primaryTextField)),
            Padding(
                padding: const EdgeInsets.only(top: 172.0, left: 24, right: 24),
                child: primaryButton(380, 60, Colors.transparent, () {
                  Get.to(
                    ResetPassword(),
                    curve: Curves.easeIn,
                    duration: Duration(seconds: 2),
                    transition: Transition.fadeIn,
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
        ));
  }
}
