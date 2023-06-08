

import 'dart:developer';

import 'package:mbti/features/mbti/domain/entities/question_entity.dart';

class QuestionEntityConverter {
  static List<QuestionEntity> toList(dynamic data) {
    log('QuestionEntityConverter : ${data.toString()}');
    return (data as List<dynamic>)
        .map((e) => QuestionEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}