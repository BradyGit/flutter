import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbti/config/providers.dart';
import 'package:mbti/features/mbti/application/questions_list_controller.dart';
import 'package:mbti/features/mbti/domain/entities/question_entity.dart';
import 'package:mbti/features/mbti/domain/responsitories/question_repository_interface.dart';
import 'package:mbti/features/mbti/infrastructure/repositories/question_repository.dart';

///
/// Infrastructure dependencies
///

final questionRepositoryProvider = Provider<QuestionRepositoryInterface>(
    (ref) => QuestionRepository(ref.watch(supabaseClientProvider)));

///
/// Application dependencies
///
final questionsListControllerProvider = StateNotifierProvider<
        QuestionsListController, AsyncValue<List<QuestionEntity>>>(
    (ref) => QuestionsListController(ref.watch(questionRepositoryProvider)));
