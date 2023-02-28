import 'package:chatter/widget/EditText.dart';
import 'package:chatter/widget/TextView.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/chatcontroller.dart';
import '../color/AppColor.dart';
import '../widget/appBar.dart';
import 'call.dart';

class IndividualChat extends StatefulWidget {
  const IndividualChat({super.key});

  @override
  State<IndividualChat> createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  chat controller = Get.put(chat());
  String? name;
  var data = Get.arguments;
  void getdetails() {
    setState(() {
      name = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getdetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar('$name', AppColors.secondaryText, false,
          AppColors.secondaryIcon, true, [
        Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              icon: Image.asset('assets/icons/call.png', height: 24, width: 24),
              onPressed: () {
                Get.to(Call(),
                    arguments: name,
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
                  controller: controller.scroll,
                  shrinkWrap: true,
                  itemCount: controller.messages.length + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.messages.length) {
                      return Container(
                        height: 60,
                      );
                    }
                    return SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Align(
                            alignment:
                                controller.messages[index]['type'] == 'sender'
                                    ? Alignment.topRight
                                    : Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: controller.messages[index]['type'] ==
                                        'receiver'
                                    ? 8.0
                                    : 0.0,
                                right: controller.messages[index]['type'] ==
                                        'sender'
                                    ? 8.0
                                    : 0.0,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, bottom: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: controller.messages[index]['type'] == 'sender'
                                          ? null
                                          : Border.all(color: AppColors.grey),
                                      color: controller.messages[index]['type'] == 'sender'
                                          ? null
                                          : Colors.white,
                                      gradient: LinearGradient(
                                          colors: controller.messages[index]['type'] == 'sender'
                                              ? AppColors.gradient
                                              : [Colors.white, Colors.white]),
                                      borderRadius: BorderRadius.only(
                                          topLeft: controller.messages[index]
                                                      ['type'] ==
                                                  'sender'
                                              ? Radius.circular(12)
                                              : Radius.circular(0),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: controller.messages[index]
                                                      ['type'] ==
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
                                      controller.messages[index]['msgcontent'],
                                      textColor: controller.messages[index]
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
                      showRectangularInputBorder: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      minLines: 2,
                      maxLines: 10,
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.scroll.animateTo(
                              controller.scroll.position.maxScrollExtent,
                              duration: Duration(seconds: 1),
                              curve: Curves.ease);
                          controller
                              .send(controller.chatController.text.toString());
                          controller.chatController.clear();
                          setState(() {});
                        },
                        icon: Image.asset(
                          'assets/icons/Send.png',
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey)),
                      borderSide: BorderSide(color: AppColors.grey),
                      controller: controller.chatController,
                    )))
          ])),
    );
  }
}
