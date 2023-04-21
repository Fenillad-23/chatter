import 'package:chatter/fireabse_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IndividualChatController extends GetxController {
  IndividualChatController();
  String? peerusername, peerusermail, currentusermail,chatID;
  TextEditingController message = TextEditingController();
  var data = Get.arguments;
  final box = GetStorage();
  ScrollController scroll = ScrollController();
  void getdetails() {
    // name = data;
    peerusername = data[1];
    peerusermail = data[0];
    chatID = data[2];
    currentusermail = box.read('email');
    print(data[0]);
    print(data[1]);
    print(data[2]);
    print(data[3]);
  }
  
  
  var messages = [].obs;
  // void getMessages() {
  //   FirebaseFirestore.instance
  //       .collection("chat")
  //       .doc(chatID)
  //       .collection(chatID.toString()).orderBy('datatime',descending: true)
  //       .snapshots();
  // }

  void sendMessages() async {
    Map<String, dynamic> msg = {
      'messageContent': message.text,
      'sender': box.read('email'),
      'receiver': data[0],
      "datatime": DateTime.now().millisecondsSinceEpoch.toString()
    };
    FirebaseConfig.storage
        .collection('chat')
        .doc(data[2])
        .collection(data[2])
        .doc()
        .set(msg)
        .then((value) {
       //   getMessages();
    });
    update();
    message.clear();
  }

  @override
  void onInit() {
    super.onInit();
    getdetails();
    // getMessages();
    
  }
}
