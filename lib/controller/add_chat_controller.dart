import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../fireabse_config.dart';
import '../toast_msg.dart';

class AddChatController extends GetxController {
  RxList chatContact = [].obs;
  String msg = '';
  String chatID = '';
  final box = GetStorage();
  @override
  void onInit() {
    fetchAllUser();
    super.onInit();
  }

  void fetchAllUser() async {
    try {
      FirebaseConfig.storage
          .collection('user')
          .where('email', isNotEqualTo: box.read('email'))
          .get()
          .then((list) {
        for (var result in list.docs) {
          print(result.data());
          chatContact.add(result.data());
        }
        refresh();
      });
    } catch (FirebaseAuthException) {
      msg = FirebaseAuthException.toString();
      toast(msg);
    }
  }

  chatId(String peer) async {
    String currentUserEmail = box.read('email');
    if (currentUserEmail.hashCode <= peer.hashCode) {
      chatID = '$currentUserEmail-$peer';
    } else {
      chatID = '$peer-$currentUserEmail';
    }
    Map<String, dynamic> addToChat = {
      'chatID': chatID,
      'users': FieldValue.arrayUnion([currentUserEmail, peer]),
      'createAt': DateTime.now().millisecondsSinceEpoch.toString()
    };
    await FirebaseConfig.storage.collection('chat').doc(chatID).set(addToChat);
  }
}
