// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionEntity _$$_QuestionEntityFromJson(Map<String, dynamic> json) =>
    _$_QuestionEntity(
      id: json['id'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_QuestionEntityToJson(_$_QuestionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'type': instance.type,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
