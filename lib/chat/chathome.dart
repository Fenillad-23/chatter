import 'package:chatter/chatcontroller/chatcontroller.dart';
import 'package:chatter/color/AppColor.dart';
import 'package:chatter/widget/AssetIcon.dart';
import 'package:chatter/widget/TextView.dart';
import 'package:chatter/widget/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'individualchat.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({super.key});

  @override
  State<ChatHome> createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  chat controller = Get.put(chat());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar('Chat', AppColors.secondaryText, false,
          AppColors.secondaryIcon, false, [
        Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.search))
      ]),
      body: SingleChildScrollView(
          child: Column(children: [
        ListView.builder(
            itemCount: controller.chatContact.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Dismissible(
                  // direction: DismissDirection.endToStart,
                  background: ColoredBox(
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: const EdgeInsets.only(right: 32.85),
                              child: Container(
                                  height: 18.48,
                                  width: 16.15,
                                  child: Image.asset(
                                    'assets/icons/delete.png',
                                  ))))),
                  onDismissed: (direction) {
                    setState(() {
                      controller.chatContact.removeAt(index);
                    });
                  },
                  key: Key(controller.chatContact[index].toString()),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          onTap: () {
                            Get.to(IndividualChat(),
                                curve: Curves.easeIn,
                                transition: Transition.fadeIn,
                                duration: Duration(seconds: 1),
                                arguments: controller.chatContact[index]
                                    ['name']);
                          },
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Stack(
                                children: [
                                  Image.asset(
                                      controller.chatContact[index]['img']),
                                  Positioned(
                                      top: 40,
                                      left: 40,
                                      child: controller.chatContact[index]
                                                  ['status'] ==
                                              "online"
                                          ? Image.asset(
                                              'assets/icons/status.png',
                                              height: 14,
                                              width: 14,
                                            )
                                          : Image.asset(
                                              'assets/icons/status.png',
                                              height: 20,
                                              width: 20,
                                            ))
                                ],
                              )),
                          title: TextView(
                            controller.chatContact[index]['name'],
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          subtitle: TextView(
                            controller.chatContact[index]['msg'],
                            fontWeight:
                                controller.chatContact[index]['msgcount'] == '0'
                                    ? FontWeight.w400
                                    : FontWeight.w500,
                            fontSize: 13,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              controller.chatContact[index]['msgcount'] == '0'
                                  ? Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              colors: AppColors.gradient)),
                                      child: AssetIcon(
                                        'assets/icons/doubleTick.png',
                                      ),
                                    )
                                  : Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: AppColors.gradient),
                                          shape: BoxShape.circle),
                                      child: Center(
                                          child: TextView(
                                              controller.chatContact[index]
                                                  ['msgcount'],
                                              textColor:
                                                  AppColors.secondaryText))),
                              TextView(controller.chatContact[index]['time'])
                            ],
                          ))));
            })
      ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 142, 39, 176),
        child: Icon(
          Icons.person_add,
        ),
        elevation: 1,
        onPressed: () {},
      ),
    );
  }
}
