

import 'package:freezed_annotation/freezed_annotation.dart';
part 'question_entity.freezed.dart';
part 'question_entity.g.dart';

///flutter pub run build_runner build
///
@freezed
class QuestionEntity with _$QuestionEntity {
  const factory QuestionEntity({
    required String id,
    required String description,
    required String type,
    required DateTime? createdAt,
  }) = _QuestionEntity;

  factory QuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionEntityFromJson(json);
}