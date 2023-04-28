import 'package:json_annotation/json_annotation.dart';
part 'chatMsg.g.dart';

@JsonSerializable()
class ChatMsg {
  String? messageContent;
  String? sender;
  String? receiver;
  String? datatime;
  String? type;
  ChatMsg(this.messageContent, this.sender, this.receiver, this.datatime,
      this.type);
  factory ChatMsg.fromJson(Map<String, dynamic> json) =>
      _$ChatMsgFromJson(json);
  Map<String, dynamic> toJson() => _$ChatMsgToJson(this);
}
