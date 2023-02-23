import 'package:chatter/color/AppColor.dart';
import 'package:chatter/widget/TextView.dart';
import 'package:chatter/widget/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/signin.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // backgroundColor: AppColors.appBackground,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.only(top: 34.0),
              child: Center(
                  child: Container(
                      height: 52,
                      width: 148,
                      child: Image.asset('assets/icons/Logo2.png')))),
          Padding(
              padding: const EdgeInsets.only(top: 49.0),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                      height: 64,
                      width: 212,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: Image.asset('assets/icons/splashimg1.png')))
                ]),
                Row(children: [
                  Container(
                      height: 88,
                      width: 238,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Image.asset('assets/icons/splashimg2.png')))
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                      height: 118,
                      width: 263,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: Image.asset('assets/icons/splashimg3.png')))
                ]),
                Row(children: [
                  Container(
                      height: 140,
                      width: 280,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Image.asset('assets/icons/splashimg4.png'),
                      ))
                ])
              ])),
          Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 60),
              child: Container(
                  height: 90,
                  width: 235,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextView('Chatter\nWelcomes you',
                            fontWeight: FontWeight.w700, fontSize: 32)
                      ]))),
          Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24, top: 16),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: TextView(
                      'Lorem ipsum dolor sit amet consectetur. Eu egestas\nultrices massa duis tortor. Interdum dolor.',
                      maxLines: 2,
                      fontSize: 16,
                      textColor: AppColors.lightText))),
          Padding(
            padding: const EdgeInsets.only(top: 48.0, right: 24, left: 24),
            child: primaryButton(380, 60, Colors.transparent, () {
              Get.to(
                SignIn(),
                curve: Curves.easeIn,
                transition: Transition.fadeIn,
              );
            }, 'Get Started', AppColors.secondaryText, 28),
          )
        ]),
      ),
    );
  }
}
