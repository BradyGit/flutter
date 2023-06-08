import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbti/features/mbti/domain/entities/question_entity.dart';
import 'package:mbti/features/mbti/domain/responsitories/question_repository_interface.dart';

class QuestionsListController extends StateNotifier<AsyncValue<List<QuestionEntity>>> {
  final QuestionRepositoryInterface _repository;

  QuestionsListController(this._repository) : super(const AsyncValue.loading()) {
    _getQuestions();
  }

  Future<void> _getQuestions() async {
    final res = await _repository.getQuestions();
    state = res.fold((l) => AsyncValue.error(l.toString(), StackTrace.current), AsyncValue.data);
  }
}