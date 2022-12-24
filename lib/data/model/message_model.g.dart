// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageModel _$$_MessageModelFromJson(Map<String, dynamic> json) =>
    _$_MessageModel(
      name: json['name'] as String?,
      message: json['message'] as String?,
      isSeen: json['is_seen'] as bool?,
      lastMessageAt: json['last_message_at'] as String?,
    );

Map<String, dynamic> _$$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'is_seen': instance.isSeen,
      'last_message_at': instance.lastMessageAt,
    };
