import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class chat extends GetxController {
  TextEditingController chatController = TextEditingController();
  ScrollController scroll = ScrollController();
  List chatContact = [
    {
      'img': 'assets/person1.png',
      'name': 'Jenny Wilson',
      'msg': 'Hope you are doing well...',
      'status': 'online',
      'msgcount': '0',
      'time': '9:41 am'
    },
    {
      'img': 'assets/person2.png',
      'name': 'Elina james',
      'msg': 'Hope you are doing well...',
      'status': 'offline',
      'msgcount': '1',
      'time': '9:41 am'
    },
    {
      'img': 'assets/person3.png',
      'name': 'Rigo Bing',
      'msg': 'Hope you are doing well...',
      'status': 'online',
      'msgcount': '1',
      'time': '9:41 am'
    },
    {
      'img': 'assets/person4.png',
      'name': 'Hector Victoria',
      'msg': 'Hope you are doing well...',
      'status': 'online',
      'msgcount': '1',
      'time': '9:41 am'
    },
    {
      'img': 'assets/person5.png',
      'name': 'Alex Phoenix',
      'msg': 'Hope you are doing well...',
      'status': 'offline',
      'msgcount': '1',
      'time': '9:41 am'
    },
  ];
  List messages = [
    {'msgcontent': 'hello', 'type': 'sender'},
    {'msgcontent': 'hy', 'type': 'receiver'},
    {'msgcontent': 'what you doin', 'type': 'sender'},
    {'msgcontent': 'nothing', 'type': 'receiver'},
    {'msgcontent': 'why?', 'type': 'sender'},
  ];
  void send(String msg) {
    messages.add({'msgcontent': msg, 'type': 'sender'});
    update();
  }
}
