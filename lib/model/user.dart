import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class Userdata {
  String? email;
  String? img;
  String? uid;
  String? username;
  Userdata(this.email,this.img,this.uid,this.username);
  factory Userdata.fromJson(Map<String, dynamic> json) =>
      _$UserdataFromJson(json);
  Map<String, dynamic> toJson() => _$UserdataToJson(this);
  }
