import 'package:chatter/fireabse_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../toast_msg.dart';

class chat extends GetxController {
  TextEditingController chatController = TextEditingController();
  ScrollController scroll = ScrollController();
  String msg = '';
  String chatID = '';
  String? peerUser = '';
  RxList chatContact = [].obs;
  RxBool chatExists = false.obs;

  List messages = [
    {'msgcontent': 'hello', 'type': 'sender'},
    {'msgcontent': 'hy', 'type': 'receiver'},
    {'msgcontent': 'what you doing', 'type': 'sender'},
    {'msgcontent': 'nothing', 'type': 'receiver'},
    {'msgcontent': 'why?', 'type': 'sender'},
  ];

  @override
  void onInit() {
    fetchAllUser();
    super.onInit();
  }

  @override
  void onClose() {
    chatID = '';
    peerUser = '';
    Get.delete<chat>();
    super.onClose();
  }

  void fetchAllUser() async {
    try {
      User? user = FirebaseConfig.auth.currentUser;
      FirebaseConfig.storage
          .collection('user')
          .where('uid', isNotEqualTo: user!.uid)
          .get()
          .then((list) {
        for (var result in list.docs) {
          print(result.data());
          chatContact.add(result.data());
        }
      });
    } catch (FirebaseAuthException) {
      msg = FirebaseAuthException.toString();
      toast(msg);
    }
  }

  void send(String msg) {
    messages.add({'msg content': msg, 'type': 'sender'});
    update();
  }

  void chatId(chatEmail) async {
    try {
      User? user = FirebaseConfig.auth.currentUser;
      await FirebaseConfig.storage
          .collection('user')
          .where('email', isEqualTo: chatEmail)
          .get()
          .then((value) async {
        for (var curusr in value.docs) {
          print(curusr['uid']);
          peerUser = curusr['uid'];
        }
        QuerySnapshot snapshots = await FirebaseConfig.storage
            .collection('chat')
            .where('users', arrayContains: [user!.uid, peerUser]).get();
        for (var snapshot in snapshots.docs) {
          if ((snapshot['users'][0] == user.uid &&
                  snapshot['users'][1] == peerUser) ||
              (snapshot['users'][0] == peerUser &&
                  snapshot['users'][1] == user.uid)) {
            chatID = snapshot['chatId'];
            break;
          } else {
               chatID = Uuid().v4();
                  await FirebaseFirestore.instance.collection("chat").doc(chatID).set({
                'chatId': chatId,
                'users': FieldValue.arrayUnion([user.uid, peerUser]),
              });

          }
        }
      });
    } catch (exception) {
      print(exception);
    }
    update();
  }
}
