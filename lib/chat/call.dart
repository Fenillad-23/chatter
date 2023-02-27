import 'package:chatter/color/AppColor.dart';
import 'package:chatter/widget/TextView.dart';
import 'package:chatter/widget/appBar.dart';
import 'package:chatter/widget/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/roundContainer.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  String? name;
  bool isGradient = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      name = Get.arguments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar('$name', AppColors.secondaryText, false,
            AppColors.secondaryIcon, true, [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.message_rounded),
          )
        ]),
        body: Center(
            child: Column(
                // gnment: MainAxisAlignment.center,
                children: [
              Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/person1.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 332.0),
                child: TextView('00.02.30'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: AppColors.gradient)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.transparent,
                              backgroundColor: Colors.transparent),
                          onPressed: (() {}),
                          child: Image.asset('assets/icons/call.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: isGradient
                                ? LinearGradient(colors: AppColors.gradient)
                                : LinearGradient(
                                    colors: [Colors.white, Colors.white])),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.transparent,
                                    backgroundColor: Colors.transparent),
                                onPressed: (() {
                                  isGradient = !isGradient;
                                  setState(() {});
                                }),
                                child: Icon(
                                  Icons.speaker,
                                  color: AppColors.grey,
                                ))))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: primaryButton(380, 60, Colors.transparent, () {},
                    'End Call', AppColors.primaryText, 28),
              )
            ])));
  }
}
