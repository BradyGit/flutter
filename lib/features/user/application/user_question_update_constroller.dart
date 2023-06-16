

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbti/features/user/domain/entities/user_question_entity.dart';
import 'package:mbti/features/user/domain/repositories/user_repository_interface.dart';

class UserQuestionUpdateController extends StateNotifier<AsyncValue<UserQuestionEntity>> {
  UserQuestionUpdateController(this._repository): super(const AsyncValue.loading()) {
    _get();
  }

  final UserQuestionRepositoryInterface _repository;

  Future<void> _get() async {
    final res = await _repository.getUserQuestion();
    state = res.fold((l) => AsyncValue.error(l.toString(), StackTrace.current), AsyncValue.data);
  }

  Future<void> update(String questionId) async {
    final res = await _repository.createOrUpdateUserQuestion(questionId);
    state = res.fold((l) => AsyncValue.error(l.toString(), StackTrace.current), AsyncValue.data);
  }
}