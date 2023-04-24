import 'package:chatter/fireabse_config.dart';
import 'package:chatter/route/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/chatUser.dart';
import '../toast_msg.dart';

class chat extends GetxController {
  TextEditingController chatController = TextEditingController();
  ScrollController scroll = ScrollController();
  String msg = '';
  var verifyChat;
  String chatID = '';
  RxString? peerUser = ''.obs;
  RxList chatContact = [].obs;
  final box = GetStorage();
  Future<void> getAvailableChatContact() async {
    try {
      FirebaseConfig.storage
          .collection('user')
          .where('email', isNotEqualTo: box.read('email'))
          .get()
          .then((list) async {
        for (var result = 0; result < list.docs.length; result++) {
          String peer = list.docs[result]['email'];
          chatId(peer);
          print(chatID);
          await FirebaseConfig.storage
              .collection('chat')
              .where('chatID', isEqualTo: chatID)
              .get()
              .then((value) {
            if (value.docs.isNotEmpty) {
              chatContact.add(list.docs[result].data());
            }
          });
          print(chatContact);
        }
        refresh();
      });
    } catch (FirebaseAuthException) {
      msg = FirebaseAuthException.toString();
      toast(msg);
    }
  }
  @override
  void onInit() {
    super.onInit();
    getAvailableChatContact();
  }
  @override
  void onClose() {
    chatID = '';
    peerUser = ''.obs;
    Get.delete<chat>();
    super.onClose();
  }
  Future<void> chatId(String peer) async {
    String currentUserEmail = box.read('email');
    if (currentUserEmail.hashCode <= peer.hashCode) {
      chatID = '$currentUserEmail-$peer';
    } else {
      chatID = '$peer-$currentUserEmail';
    }
  }
  void redirect_to_addchat() {
    Get.toNamed(RouteGenerator.addchat);
  }
}
