import 'package:chatter/widget/TextView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../color/AppColor.dart';
import '../widget/appBar.dart';
import '../widget/primaryButton.dart';
import 'editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _switchvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar('Profile', AppColors.secondaryText, false,
          AppColors.secondaryIcon, false, [
        Padding(
            padding: const EdgeInsets.only(right: 26.0),
            child: IconButton(
              icon: Icon(Icons.settings_outlined),
              onPressed: () {
                Get.to(EditProfile(), curve: Curves.easeIn);
              },
            ))
      ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 32),
                child: Row(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/person1.png',
                        height: 72,
                        width: 72,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: TextView(
                        'Adi Rajwani',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ))
                ])),
            Padding(
              padding: const EdgeInsets.only(left: 29.0, top: 40),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextView(
                      'User ID',
                      fontSize: 16,
                      textColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 51.0),
                    child: TextView(
                      '@adirijwani.chatter',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 29.0, top: 40),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/gender.png',
                    width: 20,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextView(
                      'Gender',
                      fontSize: 16,
                      textColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 51.0),
                    child: TextView(
                      'Male',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 29.0, top: 40),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/email.png',
                    width: 20,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextView(
                      'Email',
                      fontSize: 16,
                      textColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 65.0),
                    child: TextView(
                      'Adirajwani@somemail.com',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 29.0, top: 40),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/password.png',
                    width: 20,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextView(
                      'Password',
                      fontSize: 16,
                      textColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 34.0),
                    child: TextView(
                      '@adirajwani',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 29.0, top: 40),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/Notification.png',
                    width: 20,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextView(
                      'Notification',
                      fontSize: 16,
                      textColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 34.0),
                    child: Container(
                      height: 15.57,
                      width: 23.28,
                      child: CupertinoSwitch(
                        activeColor: Color.fromARGB(255, 156, 71, 171),
                        value: _switchvalue,
                        onChanged: (value) {
                          _switchvalue = value;
                          setState(() {});
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 24, right: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: primaryButton(380, 60, Colors.transparent, () {},
                          'Log Out', AppColors.secondaryText, 28),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
