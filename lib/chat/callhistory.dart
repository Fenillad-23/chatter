import 'package:chatter/color/AppColor.dart';
import 'package:chatter/widget/TextView.dart';
import 'package:chatter/widget/appBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/chatcontroller.dart';
import 'call.dart';

class CallHistory extends StatefulWidget {
  const CallHistory({super.key});

  @override
  State<CallHistory> createState() => _CallState();
}

class _CallState extends State<CallHistory> {
  chat controller = Get.put(chat());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar('calls', AppColors.secondaryText, false,
            AppColors.primaryIcon, false, [
          Padding(
            padding: const EdgeInsets.only(right: 29.0),
            child: Icon(Icons.search_outlined),
          )
        ]),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.chatContact.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ListTile(
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                    controller.chatContact[index]['img'])),
                            title: TextView(
                              controller.chatContact[index]['name'],
                              fontWeight: FontWeight.w500,
                            ),
                            subtitle: Row(children: [
                              Icon(
                                Icons.call_missed_outgoing,
                                size: 14,
                              ),
                              TextView('3 min ago')
                            ]),
                            trailing: IconButton(
                                icon: Image.asset(
                                  'assets/icons/call.png',
                                  color: Colors.purpleAccent,
                                ),
                                onPressed: () {
                                  Get.to(Call(),
                                      arguments: controller.chatContact[index]
                                          ['name'],
                                      curve: Curves.ease,
                                      transition: Transition.fadeIn);
                                })));
                  }))
        ])));
  }
}
