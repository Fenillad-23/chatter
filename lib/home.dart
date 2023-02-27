import 'package:chatter/color/AppColor.dart';
import 'package:flutter/material.dart';

import 'chat/callhistory.dart';
import 'chat/chathome.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var index = 0;
  List screens = [ChatHome(), CallHistory(), ChatHome(), CallHistory()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(index),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: BottomNavigationBar(
            selectedItemColor: Colors.purple,
            unselectedItemColor: AppColors.grey,
            currentIndex: index,
            elevation: 1,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_outlined), label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.call_outlined), label: 'Calls'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: 'Peoples'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile')
            ],
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
