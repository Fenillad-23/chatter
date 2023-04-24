import 'package:json_annotation/json_annotation.dart';
part 'chatUser.g.dart';
@JsonSerializable()
class ChatUser {
  String? Email;
  String? img;
  String? name;
  ChatUser(this.Email,this.img,this.name);
  factory ChatUser.fromJson(Map<String,dynamic> json)=> _$ChatUserFromJson(json);
  Map<String, dynamic> toJson() => _$ChatUserToJson(this);
}