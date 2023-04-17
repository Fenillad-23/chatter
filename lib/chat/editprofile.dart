import 'package:chatter/controller/editProfile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../color/AppColor.dart';
import '../widget/AssetIcon.dart';
import '../widget/EditText.dart';
import '../widget/TextView.dart';
import '../widget/appBar.dart';
import '../widget/primaryButton.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  editprofile controller = Get.put(editprofile());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar('Edit Profile', AppColors.secondaryText, false,
          AppColors.secondaryIcon, true, []),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Stack(children: [
                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/person1.png',
                        height: 120,
                        width: 120,
                      )),
                ),
                Positioned(
                    left: 235,
                    top: 80,
                    child: Image.asset(
                      'assets/icons/camera.png',
                      height: 32,
                      width: 32,
                    ))
              ])),
          Padding(
              padding: EdgeInsets.only(top: 56, left: 24, right: 24),
              child: EditText(
                  // controller: signincontroller.email,
                  fontSize: 16,
                  filled: true,
                  hint: 'Enter your Name',
                  prefixIcon: Icon(
                    Icons.person,
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
                  // controller: signincontroller.email,
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
                  // controller: signincontroller.password,
                  fontSize: 16,
                  obscureText: controller.obscure,
                  filled: true,
                  hint: 'Enter Password',
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
              padding: const EdgeInsets.only(left: 24.0, right: 24, top: 32),
              child: DropdownButtonFormField(
                  itemHeight: 56,
                  isDense: true,
                  icon: AssetIcon('assets/icons/dropdownopen.png'),
                  borderRadius: BorderRadius.circular(12),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(style: BorderStyle.none))),
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
                    controller.gender = value ?? 'unknown';
                    setState(() {});
                  }))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 24, right: 24),
              child: Row(
                children: [
                  Expanded(
                    child: primaryButton(380, 60, Colors.transparent, () {},
                        'Save', AppColors.secondaryText, 28),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
