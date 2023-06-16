import 'dart:developer';

import 'package:fpdart/src/either.dart';
import 'package:mbti/features/common/domain/failures/failure.dart';
import 'package:mbti/features/mbti/domain/entities/question_entity.dart';
import 'package:mbti/features/mbti/domain/responsitories/question_repository_interface.dart';
import 'package:mbti/features/mbti/infrastructure/repositories/question_entity_converter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QuestionRepository implements QuestionRepositoryInterface {
  QuestionRepository(this.client);

  final SupabaseClient client;

  static const String _table = 'mbti_questions';

  @override
  Future<Either<Failure, List<QuestionEntity>>> getQuestions() async {
    try {
      final data = await client
          .from(_table)
          .select('*')
          .withConverter(QuestionEntityConverter.toList);
      log('QuestionRepository getQuestions : ${data.toString()}');
      return right(data);
    } catch (e) {
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }
}
