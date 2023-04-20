import 'package:chatter/fireabse_config.dart';
import 'package:chatter/route/route_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../toast_msg.dart';

class chat extends GetxController {
  TextEditingController chatController = TextEditingController();
  ScrollController scroll = ScrollController();
  String msg = '';
  var verifyChat;
  RxString chatID = ''.obs;
  RxString? peerUser = ''.obs;
  RxList chatContact = [].obs;

  final box =GetStorage();
  List messages = [
    {'msgcontent': 'hello', 'type': 'sender'},
    {'msgcontent': 'hy', 'type': 'receiver'},
    {'msgcontent': 'what you doing', 'type': 'sender'},
    {'msgcontent': 'nothing', 'type': 'receiver'},
    {'msgcontent': 'why?', 'type': 'sender'},
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    chatID = ''.obs;
    peerUser = ''.obs;
    Get.delete<chat>();
    super.onClose();
  }


  void send(String msg) {
    messages.add({'msg content': msg, 'type': 'sender'});
    update();
  }
 Future<void> chatId(String peer) async {
    String currentUserEmail = box.read('email');
    if (currentUserEmail.hashCode <= peer.hashCode) {
      chatID.value = '$currentUserEmail-$peer';
    } else {
      chatID.value = '$peer-$currentUserEmail';
    }
  }
  void redirect_to_addchat() {
    Get.toNamed(RouteGenerator.addchat);
  }
}
