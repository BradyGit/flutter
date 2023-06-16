import 'dart:developer';

import 'package:fpdart/src/either.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mbti/features/common/domain/failures/failure.dart';
import 'package:mbti/features/user/domain/entities/user_question_entity.dart';
import 'package:mbti/features/user/domain/entities/user_question_entity_converter.dart';
import 'package:mbti/features/user/domain/repositories/user_repository_interface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserQuestionRepository implements UserQuestionRepositoryInterface {
  UserQuestionRepository(this.client, this.userId);

  final SupabaseClient client;
  final String userId;

  static const String _table = 'mbti_user';

  @override
  Future<Either<Failure, UserQuestionEntity>> createOrUpdateUserQuestion(
      String questionId) async {
    log('UserQuestionRepository userid: $userId');
    log('UserQuestionRepository questionId: $questionId');
    try {
      final data = await client
          .from(_table)
          .upsert({
            'user_id': userId,
            'currentQuestionId': questionId,
            'result': '',
          })
          .select()
          .withConverter(UserQuestionEntityConverter.toSingle);
      return right(data);
    } catch (e) {
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserQuestionEntity>> getUserQuestion() async {
    try {
      final data = await client
          .from(_table)
          .select()
          .eq('user_id', userId)
          .withConverter(UserQuestionEntityConverter.toSingle);
      return right(data);
    } catch (e) {
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }
}
