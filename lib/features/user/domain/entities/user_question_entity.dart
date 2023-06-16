
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_question_entity.freezed.dart';
part 'user_question_entity.g.dart';

@freezed
class UserQuestionEntity with _$UserQuestionEntity {
  const factory UserQuestionEntity({
    required String currentQuestionId,
    required String result,
  }) = _UserQuestionEntity;

  factory UserQuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$UserQuestionEntityFromJson(json);
}