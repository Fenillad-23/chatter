import 'dart:io';

import 'package:chatter/fireabse_config.dart';
import 'package:chatter/model/chatMsg.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class IndividualChatController extends GetxController {
  IndividualChatController();
  XFile? image;
  RxBool isSelectedImage = false.obs;
  final ImagePicker picker = ImagePicker();
  String? peerusername, peerusermail, currentusermail, chatID;
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
  void sendMessages(String type, String msgContent) async {
    ChatMsg text = ChatMsg(msgContent, box.read('email'), data[0],
        DateTime.now().millisecondsSinceEpoch.toString(), type);
    Map<String, dynamic> msg = text.toJson();
    FirebaseConfig.storage
        .collection('chat')
        .doc(data[2])
        .collection(data[2])
        .doc()
        .set(msg)
        .then((value) {});
    update();
    message.clear();
  }

  Future<void> selectMedia() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    print(image!.path);
    if (image != null) {
      await FirebaseConfig.media
          .ref()
          .child('chat/${image!.name}')
          .putFile(File(image!.path))
          .then((p0) => print('image uploaded'));
      Reference rf = await FirebaseConfig.media
          .ref()
          .child('chat/${image!.name}');
      String path = await rf.getDownloadURL();
      sendMessages('1',path);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getdetails();
    // getMessages();
  }
}
