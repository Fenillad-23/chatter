import 'package:chatter/fireabse_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IndividualChatController extends GetxController {
  String? peerusername;
  TextEditingController message = TextEditingController();
  var data = Get.arguments;
  final box = GetStorage();
  ScrollController scroll = ScrollController();
  void getdetails() {
    // name = data;
    peerusername = data[1];
    print(data[0]);
    print(data[1]);

    print(data[2]);
    print(data[3]);
  }

  List messages = [
    {"messageContent": "Hello", "messageType": "receiver"},
    {"messageContent": "what's up", "messageType": "receiver"},
    {"messageContent": "nothing special", "messageType": "sender"},
    {"messageContent": "ehhhh, doing OK.", "messageType": "receiver"},
    {"messageContent": "Is there any thing wrong?", "messageType": "sender"},
  ];
  void getMessages() {
    FirebaseConfig.storage
        .collection('chat')
        .doc(data[2])
        .collection(data[2])
        .doc()
        .snapshots();
  }

  void sendMessages() async {
    messages.add({
      'msg': message.text,
      'sender': box.read('email'),
      'receiver': data[0],
      "time": Timestamp.now()
          .microsecondsSinceEpoch
          .toString()
    });
    message.clear();
  }

  @override
  void onInit() {
    super.onInit();
    getdetails();
  }
}
