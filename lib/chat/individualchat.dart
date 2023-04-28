import 'package:chatter/model/chatMsg.dart';
import 'package:chatter/toast_msg.dart';
import 'package:chatter/widget/EditText.dart';
import 'package:chatter/widget/TextView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../color/AppColor.dart';
import '../controller/individual_chat_controller.dart';
import '../widget/appBar.dart';
import 'call.dart';
import 'package:cached_network_image/cached_network_image.dart';

class IndividualChat extends StatelessWidget {
  const IndividualChat({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndividualChatController>(
      init: IndividualChatController(),
      builder: (_) {
        return Scaffold(
          appBar: Appbar(_.peerusername, AppColors.secondaryText, false,
              AppColors.secondaryIcon, true, [
            Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: IconButton(
                  icon: Image.asset('assets/icons/call.png',
                      height: 24, width: 24),
                  onPressed: () {
                    Get.to(Call(),
                        arguments: '',
                        curve: Curves.ease,
                        transition: Transition.fadeIn);
                  },
                )),
          ]),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 60),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("chat")
                          .doc(_.chatID)
                          .collection(_.chatID.toString())
                          .orderBy('datatime', descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          _.messages.assignAll(snapshot.data!.docs
                              .map((e) => ChatMsg.fromJson(
                                  e.data() as Map<String, dynamic>))
                              .toList());
                          _.messages.reversed;
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: ListView.builder(
                              reverse: true,
                              controller: _.scroll,
                              shrinkWrap: false,
                              itemCount: _.messages.length + 1,
                              itemBuilder: (context, index) {
                                // _.messages = _.messages.reversed.toList().obs;
                                if (index == _.messages.length) {
                                  return Container(
                                    height: 70,
                                  );
                                }
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: _.messages[index].sender ==
                                                _.currentusermail
                                            ? Alignment.topRight
                                            : Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: _.messages[index].sender ==
                                                        _.currentusermail
                                                    ? null
                                                    : Border.all(
                                                        color: AppColors.grey),
                                                color: _.messages[index].sender ==
                                                        _.currentusermail
                                                    ? null
                                                    : Colors.white,
                                                gradient: LinearGradient(
                                                    colors:
                                                        _.messages[index].sender == _.currentusermail
                                                            ? AppColors.gradient
                                                            : [
                                                                Colors.white,
                                                                Colors.white
                                                              ]),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: _.messages[index].sender ==
                                                            _.currentusermail
                                                        ? Radius.circular(12)
                                                        : Radius.circular(0),
                                                    bottomLeft: Radius.circular(12),
                                                    bottomRight: Radius.circular(12),
                                                    topRight: _.messages[index].sender == _.currentusermail ? Radius.circular(0) : Radius.circular(12))),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left:
                                                      _.messages[index].type ==
                                                              "1"
                                                          ? 2
                                                          : 12.0,
                                                  top: _.messages[index].type ==
                                                          "1"
                                                      ? 0
                                                      : 10,
                                                  right:
                                                      _.messages[index].type ==
                                                              "1"
                                                          ? 2
                                                          : 32,
                                                  bottom:
                                                      _.messages[index].type ==
                                                              "1"
                                                          ? 0
                                                          : 12),
                                              child: _.messages[index].type ==
                                                      "0"
                                                  ? TextView(
                                                      _.messages[index]
                                                          .messageContent,
                                                      textColor: _
                                                                  .messages[
                                                                      index]
                                                                  .sender ==
                                                              _.currentusermail
                                                          ? Colors.white
                                                          : AppColors
                                                              .primaryText,
                                                      fontSize: 16,
                                                    )
                                                  : SizedBox(
                                                      height: 350,
                                                      width: 148,
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: _
                                                                      .messages[
                                                                          index]
                                                                      .messageContent ??
                                                                  "",
                                                              fit: BoxFit.cover,
                                                              height: 348,
                                                              width: 148,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      child: EditText(
                        controller: _.message,
                        hint: 'Type Messages',
                        borderRadius: 26,
                        showRectangularInputBorder: true,
                        showBorder: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        minLines: 2,
                        maxLines: 10,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.image,
                            size: 20,
                          ),
                          onPressed: () {
                            _.selectMedia();
                          },
                        ),
                        suffixIcon: IconButton(
                          iconSize: 15,
                          onPressed: () {
                            if (_.message.text != '') {
                              _.sendMessages('0', _.message.text);
                              _.scroll.position.animateTo(
                                  _.scroll.position.maxScrollExtent,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.ease);
                            } else {
                              String msg = 'empty msg';
                              toast(msg);
                            }
                          },
                          icon: Image.asset(
                            'assets/icons/Send.png',
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                            maxHeight: 45, minWidth: 15, maxWidth: 45),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey),
                        ),
                        borderSide: BorderSide(color: AppColors.grey),
                        // controller: controller.chatController,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
