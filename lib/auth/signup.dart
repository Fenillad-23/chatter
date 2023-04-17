import 'package:chatter/auth/signin.dart';
import 'package:chatter/widget/AssetIcon.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../color/AppColor.dart';
import '../controller/signupcontroller.dart';
import '../widget/EditText.dart';
import '../widget/TextView.dart';
import '../widget/appBar.dart';
import '../widget/primaryButton.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<signup>(
      init: signup(),
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: Appbar('Sign Up', AppColors.primaryText, true,
              AppColors.primaryIcon, false),
          body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 24.0, top: 50),
                            child: Row(children: [
                              Expanded(
                                  child: TextView('Chatter\nWelcomes You!',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32))
                            ])),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, left: 24, right: 56),
                            child: TextView(
                                'Please fill the details to sign up',
                                fontSize: 16,
                                textColor: AppColors.lightText)),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 56, left: 24, right: 24),
                            child: EditText(
                                controller: _.name,
                                fontSize: 16,
                                filled: true,
                                hint: 'Enter your Name',
                                prefixIcon: Icon(
                                  Icons.person_rounded,
                                  color: Colors.grey.shade500,
                                ),
                                border: InputBorder.none,
                                showRectangularInputBorder: true,
                                borderRadius: 12,
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                                fillColor: AppColors.primaryTextField)),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 32, left: 24, right: 24),
                            child: EditText(
                                controller: _.email,
                                fontSize: 16,
                                filled: true,
                                hint: 'Enter your Email',
                                prefixIcon: Icon(
                                  Icons.email_rounded,
                                  color: Colors.grey.shade500,
                                ),
                                border: InputBorder.none,
                                showRectangularInputBorder: true,
                                borderRadius: 12,
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                                fillColor: AppColors.primaryTextField)),
                        Padding(
                            padding:
                                EdgeInsets.only(top: 32, left: 24, right: 24),
                            child: EditText(
                                controller: _.password,
                                fontSize: 16,
                                obscureText: _.obscure,
                                filled: true,
                                hint: 'Enter Password',
                                prefixIcon: Icon(
                                  Icons.lock_rounded,
                                  color: Colors.grey.shade500,
                                ),
                                suffixIcon: _.obscure
                                    ? IconButton(
                                        icon: Icon(Icons.visibility_rounded),
                                        onPressed: () {
                                          setState(() {
                                            _.Obscure(_.obscure);
                                          });
                                        },
                                      )
                                    : IconButton(
                                        icon:
                                            Icon(Icons.visibility_off_rounded),
                                        onPressed: () {
                                          setState(() {
                                            _.Obscure(_.obscure);
                                          });
                                        }),
                                border: InputBorder.none,
                                showRectangularInputBorder: true,
                                borderRadius: 12,
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                                fillColor: AppColors.primaryTextField)),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, right: 24, top: 32),
                            child: DropdownButtonFormField(
                                itemHeight: 56,
                                isDense: true,
                                icon:
                                    AssetIcon('assets/icons/dropdownopen.png'),
                                borderRadius: BorderRadius.circular(12),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    enabled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200))),
                                items: [
                                  DropdownMenuItem(
                                    child: Row(children: [
                                      Icon(Icons.female_rounded),
                                      TextView('Female')
                                    ]),
                                    value: 'female',
                                  ),
                                  DropdownMenuItem(
                                      child: Row(children: [
                                    Icon(Icons.male_rounded),
                                    TextView('Male')
                                  ]))
                                ],
                                onChanged: ((value) {
                                  _.gender = value ?? 'unknown';
                                  setState(() {});
                                }))),
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 110.0, left: 24, right: 24),
                            child:
                                primaryButton(380, 60, Colors.transparent, () {
                                  _.verify_user_data();
                            }, 'Sign Up', AppColors.secondaryText, 28)),
                        Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: GestureDetector(
                                onTap: () {
                                  Get.to(SignIn());
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextView('Don\'t Have an Account?',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                      TextView('Sign In',
                                          textColor: Colors.purpleAccent,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)
                                    ]),),),
                      ]),),),
        );
      },
    );
  }
}
