

import 'package:mbti/features/user/domain/entities/user_question_entity.dart';

class UserQuestionEntityConverter {
  static UserQuestionEntity toSingle(dynamic data) {
    return UserQuestionEntity.fromJson(
      (data as List).first as Map<String, dynamic>,
    );
  }
}