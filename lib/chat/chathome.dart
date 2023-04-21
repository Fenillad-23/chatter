import 'package:chatter/controller/chatcontroller.dart';
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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<chat>(
      init: chat(),
      builder: (_) {
        return Scaffold(
          appBar: Appbar('Chat', AppColors.secondaryText, false,
              AppColors.secondaryIcon, false, [
            Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Icon(Icons.search))
          ]),
          body: SingleChildScrollView(
            child: Obx(
              () => Column(children: [
                _.chatContact.length == 0
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _.chatContact.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Dismissible(
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
                                      _.chatContact[index]['img'],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onDismissed: (direction) {
                              setState(() {
                                _.chatContact.removeAt(index);
                              });
                            },
                            key: Key(_.chatContact[index].toString()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () async{
                                 await _.chatId(_.chatContact[index]['email']);
                                  Get.to(IndividualChat(), arguments: [
                                    _.chatContact[index]['email'].toString(),
                                    _.box.read('email'),
                                    _.chatID
                                  ]);
                                },
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                            _.chatContact[index]['img']),
                                      ],
                                    )),
                                title: TextView(
                                  _.chatContact[index]['username'],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              colors: AppColors.gradient)),
                                      child: AssetIcon(
                                        'assets/icons/doubleTick.png',
                                      ),
                                    ),
                                    TextView(_.chatContact[index]['time'])
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
              ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 142, 39, 176),
            child: Icon(
              Icons.person_add,
            ),
            elevation: 1,
            onPressed: () {
              _.redirect_to_addchat();
            },
          ),
        );
      },
    );
  }
}
