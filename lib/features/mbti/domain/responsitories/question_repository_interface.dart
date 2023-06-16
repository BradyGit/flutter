

import 'package:fpdart/fpdart.dart';
import 'package:mbti/features/common/domain/failures/failure.dart';
import 'package:mbti/features/mbti/domain/entities/question_entity.dart';

abstract interface class QuestionRepositoryInterface {
  /// get questions list
  Future<Either<Failure, List<QuestionEntity>>> getQuestions();

}