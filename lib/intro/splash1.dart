import 'dart:async';

import 'package:chatter/intro/splash2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), go);
    super.initState();
  }

  void go() {
    Get.to(SplashScreen2(),
        transition: Transition.fade,
        curve: Curves.ease,
        duration: Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 120.0),
            child: Container(
                height: 66,
                width: 187,
                child: Image.asset('assets/icons/Logo2.png')),
          )
        ],
      ),
    );
  }
}
