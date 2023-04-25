// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatMsg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMsg _$ChatMsgFromJson(Map<String, dynamic> json) => ChatMsg(
      json['messageContent'] as String?,
      json['sender'] as String?,
      json['receiver'] as String?,
      json['datatime'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$ChatMsgToJson(ChatMsg instance) => <String, dynamic>{
      'messageContent': instance.messageContent,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'datatime': instance.datatime,
      'type': instance.type,
    };
