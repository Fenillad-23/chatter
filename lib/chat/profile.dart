import 'package:chatter/fireabse_config.dart';
import 'package:chatter/route/route_generator.dart';
import 'package:chatter/widget/TextView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../color/AppColor.dart';
import '../controller/editProfile.dart';
import '../widget/appBar.dart';
import '../widget/primaryButton.dart';
import 'editprofile.dart';

class Profile extends StatelessWidget {
   Profile({super.key});

  bool _switchvalue = false;

  @override
  Widget build(BuildContext context) {
   return GetBuilder<editprofile>(
       init: editprofile(),
       builder: (_){
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
                         _.box.read('img'),
                         height: 72,
                         width: 72,
                       )),
                   Padding(
                       padding: const EdgeInsets.only(left: 18.0),
                       child: TextView(
                         _.box.read('username'),
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
                       _.box.read('email'),
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
                       child: primaryButton(380, 60, Colors.transparent, () async{
                         await FirebaseConfig.auth.signOut();
                         _.box.erase();
                         Get.offNamed(RouteGenerator.login);
                       },
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
   });
  }
}
