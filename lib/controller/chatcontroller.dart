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

  void chatId(chatEmail) {
    User? user = FirebaseConfig.auth.currentUser;
    RxString currentUserEmail = ''.obs;
    FirebaseConfig.storage
        .collection('user')
        .where('uid', isEqualTo: user!.uid)
        .get()
        .then((value) {
      for (var curusr in value.docs) {
        print('hello this are the room ids of user');
        currentUserEmail.value = curusr['email'];
      }
    });
    FirebaseConfig.storage
        .collection('chat')
        .where('users', arrayContainsAny: [chatEmail, currentUserEmail.value])
        .get()
        .then((value) {
          if (value.docs.length > 0) {
            print('user chat exists');
          } else {
            FirebaseFirestore.instance.collection("chat").add({
              'users':
                  FieldValue.arrayUnion([currentUserEmail.value, chatEmail]),
            }).then((value) => print(value.id));
            print('new user chat has been created');
          }
        });
  }
}
