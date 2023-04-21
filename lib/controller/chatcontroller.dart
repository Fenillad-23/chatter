import 'package:chatter/fireabse_config.dart';
import 'package:chatter/route/route_generator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../toast_msg.dart';

class chat extends GetxController {
  TextEditingController chatController = TextEditingController();
  ScrollController scroll = ScrollController();
  String msg = '';
  var verifyChat;
  String chatID = '';
  RxString? peerUser = ''.obs;
  RxList chatContact = [].obs;
  RxList dummyList = [].obs;
  final box = GetStorage();
  List messages = [
    {'msgcontent': 'hello', 'type': 'sender'},
    {'msgcontent': 'hy', 'type': 'receiver'},
    {'msgcontent': 'what you doing', 'type': 'sender'},
    {'msgcontent': 'nothing', 'type': 'receiver'},
    {'msgcontent': 'why?', 'type': 'sender'},
  ];
  getAvailableChatContact() async {
    try {
      FirebaseConfig.storage
          .collection('user')
          .where('email', isNotEqualTo: box.read('email'))
          .get()
          .then((list) async {
        for (var result in list.docs) {
          print(result.data());
          String currentUserEmail = box.read('email');

          dummyList.add(result.data());
          // print(chatContact[]);
          for (var i = 0; i < dummyList.length; i++) {
            peerUser!.value = dummyList[i]['email'];
            if (currentUserEmail.hashCode <= peerUser.hashCode) {
              chatID = '$chatContact-${peerUser?.value}';
            } else {
              chatID = '${peerUser!.value}-$currentUserEmail';
            }
            var I = await FirebaseConfig.storage
                .collection('chat')
                .where('chatID')
                .snapshots()
                .length;
            if (I > 0) {
              chatContact.add(dummyList[i]);
              update();
            }
            print(chatContact);
            print("------------------${chatID}");
            print(chatContact[i]['email']);
            print(chatContact[i]['username']);
          }
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

  void send(String msg) {
    messages.add({'msg content': msg, 'type': 'sender'});
    update();
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
