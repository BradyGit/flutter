import 'package:fpdart/fpdart.dart';
import 'package:mbti/features/common/domain/failures/failure.dart';
import 'package:mbti/features/user/domain/entities/user_question_entity.dart';

abstract interface class UserQuestionRepositoryInterface {
  Future<Either<Failure, UserQuestionEntity>> getUserQuestion();

  Future<Either<Failure, UserQuestionEntity>> createOrUpdateUserQuestion(
      String questionId);
}
