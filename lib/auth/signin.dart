import 'package:chatter/auth/forgotpassword.dart';
import 'package:chatter/auth/signup.dart';
import 'package:chatter/widget/EditText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../chat/chathome.dart';
import '../color/AppColor.dart';
import '../controller/signincontroller.dart';
import '../widget/TextView.dart';
import '../widget/appBar.dart';
import '../widget/primaryButton.dart';
import '../widget/roundContainer.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  signin signincontroller = Get.put(signin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: Appbar('Sign In', AppColors.primaryText, true,
            AppColors.primaryIcon, true),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 50),
                child: Row(children: [
                  Expanded(
                      child: TextView('Chatter\nWelcomes You!',
                          fontWeight: FontWeight.w700, fontSize: 32))
                ])),
            Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 24, right: 56),
                child: TextView(
                    'Please input your Email Id and Password to login',
                    fontSize: 16,
                    textColor: AppColors.lightText)),
            Padding(
                padding: EdgeInsets.only(top: 56, left: 24, right: 24),
                child: EditText(
                    controller: signincontroller.email,
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
                padding: EdgeInsets.only(top: 32, left: 24, right: 24),
                child: EditText(
                    controller: signincontroller.password,
                    fontSize: 16,
                    obscureText: signincontroller.obscure,
                    filled: true,
                    hint: 'Enter Password',
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                      color: Colors.grey.shade500,
                    ),
                    suffixIcon: signincontroller.obscure
                        ? IconButton(
                            icon: Icon(Icons.visibility_rounded),
                            onPressed: () {
                              setState(() {
                                signincontroller.Obscure(
                                    signincontroller.obscure);
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.visibility_off_rounded),
                            onPressed: () {
                              setState(() {
                                signincontroller.Obscure(
                                    signincontroller.obscure);
                              });
                            },
                          ),
                    border: InputBorder.none,
                    showRectangularInputBorder: true,
                    borderRadius: 12,
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    fillColor: AppColors.primaryTextField)),
            Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 18.29),
                child: Row(children: [
                  Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 185, 97, 161)),
                      side: BorderSide(
                          color: Color.fromARGB(255, 196, 103, 172),
                          style: BorderStyle.solid,
                          width: 2),
                      value: signincontroller.remember,
                      onChanged: ((value) {
                        signincontroller.Remember(value!);
                        setState(() {});
                      }),
                      shape: CircleBorder()),
                  Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextView('Remember Me',
                          textColor: AppColors.lightText, fontSize: 16))
                ])),
            Padding(
                padding: const EdgeInsets.only(top: 48.0, left: 24, right: 24),
                child: primaryButton(380, 60, Colors.transparent, () {
                  Get.to(
                    ChatHome(),
                    curve: Curves.easeIn,
                    transition: Transition.fadeIn,
                  );
                }, 'Sign In', AppColors.secondaryText, 28)),
            Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(ForgotPassword(),
                        curve: Curves.easeIn,
                        transition: Transition.fadeIn,
                        duration: Duration(seconds: 2));
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextView('Forgot Password?',
                            fontSize: 22, fontWeight: FontWeight.w500)
                      ]),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextView(
                    'OR',
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.lightText,
                  )
                ])),
            Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 32),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundContainer(
                          64, 64, 'assets/icons/google_logo.png', () {}),
                      RoundContainer(
                          64, 64, 'assets/icons/facebook_logo.png', () {}),
                      RoundContainer(
                          64, 64, 'assets/icons/apple_logo.png', () {})
                    ])),
            Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: GestureDetector(
                    onTap: () {
                      Get.to(SignUp(),
                          transition: Transition.fadeIn,
                          duration: Duration(seconds: 2));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextView('Don\'t Have an Account?',
                              fontSize: 20, fontWeight: FontWeight.w400),
                          TextView('Sign Up',
                              textColor: Colors.purpleAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)
                        ])))
          ]),
        ));
  }
}
