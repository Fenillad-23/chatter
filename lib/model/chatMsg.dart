import 'package:json_annotation/json_annotation.dart';
part 'chatMsg.g.dart';
@JsonSerializable()
class ChatMsg {
  String? messageContent;
  String? sender;
  String? receiver;
  String? datatime;
  ChatMsg(this.messageContent,this.sender,this.receiver,this.datatime);
  Map<String, dynamic> toJson() => _$ChatMsgToJson(this);
}