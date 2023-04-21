import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color/AppColor.dart';
import '../controller/add_chat_controller.dart';
import '../widget/AssetIcon.dart';
import '../widget/TextView.dart';
import '../widget/appBar.dart';
import 'individualchat.dart';

class AddChatScreen extends StatelessWidget {
  const AddChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddChatController>(
        init: AddChatController(),
        builder: (_) {
          return Scaffold(
            appBar: Appbar('Add New Chat', AppColors.secondaryText, false,
                AppColors.secondaryIcon, false, []),
            body: ListView.builder(
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
                      _.chatContact.removeAt(index);
                    },
                    key: Key(_.chatContact[index].toString()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () async {
                          await _.chatId(_.chatContact[index]['email']);
                          Get.to(IndividualChat(), arguments: [
                            _.chatContact[index]['email'],
                            _.chatContact[index]['username'],
                            _.chatID,
                            _.chatContact[index]['img'],
                          ]);
                        },
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Stack(
                              children: [
                                Image.asset(_.chatContact[index]['img']),
                              ],
                            )),
                        title: TextView(
                          _.chatContact[index]['username'],
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                }),
          );
        });
  }
}
