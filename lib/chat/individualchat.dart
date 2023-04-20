import 'package:chatter/widget/EditText.dart';
import 'package:chatter/widget/TextView.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/chatcontroller.dart';
import '../color/AppColor.dart';
import '../controller/individual_chat_controller.dart';
import '../widget/appBar.dart';
import 'call.dart';

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
              child: Stack(alignment: AlignmentDirectional.topStart, children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListView.builder(
                      controller: _.scroll,
                      shrinkWrap: true,
                      itemCount: _.messages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == _.messages.length) {
                          return Container(
                            height: 60,
                          );
                        }
                        return SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              Align(
                                alignment: _.messages[index]['type'] == 'sender'
                                    ? Alignment.topRight
                                    : Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        _.messages[index]['type'] == 'receiver'
                                            ? 8.0
                                            : 0.0,
                                    right: _.messages[index]['type'] == 'sender'
                                        ? 8.0
                                        : 0.0,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: _.messages[index]['type'] == 'sender'
                                              ? null
                                              : Border.all(
                                                  color: AppColors.grey),
                                          color: _.messages[index]['type'] == 'sender'
                                              ? null
                                              : Colors.white,
                                          gradient: LinearGradient(
                                              colors: _.messages[index]['type'] == 'sender'
                                                  ? AppColors.gradient
                                                  : [
                                                      Colors.white,
                                                      Colors.white
                                                    ]),
                                          borderRadius: BorderRadius.only(
                                              topLeft: _.messages[index]['type'] ==
                                                      'sender'
                                                  ? Radius.circular(12)
                                                  : Radius.circular(0),
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12),
                                              topRight: _.messages[index]['type'] ==
                                                      'receiver'
                                                  ? Radius.circular(12)
                                                  : Radius.circular(0))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0,
                                            top: 10,
                                            right: 32,
                                            bottom: 12),
                                        child: TextView(
                                          _.messages[index]['msgcontent'],
                                          textColor: _.messages[index]
                                                      ['type'] ==
                                                  'sender'
                                              ? Colors.white
                                              : AppColors.primaryText,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]));
                      }),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(color: AppColors.grey)],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        width: MediaQuery.of(context).size.width,
                        height: 64,
                        child: EditText(
                          hint: 'Type Messages',
                          borderRadius: 12,
                          showBorder: false,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          minLines: 2,
                          maxLines: 10,
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _.scroll.animateTo(
                                  _.scroll.position.maxScrollExtent,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.ease);
                              // _.send();
                            },
                            icon: Image.asset(
                              'assets/icons/Send.png',
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey)),
                          borderSide: BorderSide(color: AppColors.grey),
                          // controller: controller.chatController,
                        )))
              ])),
        );
      },
    );
  }
}
