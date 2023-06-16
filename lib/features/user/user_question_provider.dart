import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mbti/config/providers.dart';
import 'package:mbti/features/auth/auth_provider.dart';
import 'package:mbti/features/common/domain/failures/failure.dart';
import 'package:mbti/features/user/application/user_question_update_constroller.dart';
import 'package:mbti/features/user/domain/entities/user_question_entity.dart';
import 'package:mbti/features/user/domain/repositories/user_repository_interface.dart';
import 'package:mbti/features/user/infrastructure/repositories/user_repository.dart';

final userQuestionRepositoryProvider =
Provider<UserQuestionRepositoryInterface>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  final userId = authRepository.currentUser?.id ?? '';

  return UserQuestionRepository(ref.watch(supabaseClientProvider), userId);
});

final userQuestionUpdateControllerProvider = StateNotifierProvider<
    UserQuestionUpdateController,
    AsyncValue<UserQuestionEntity>>((ref) {
  final repo = ref.watch(userQuestionRepositoryProvider);
  final response = UserQuestionUpdateController(repo);
  return response;
});

final userQuestionProvider = FutureProvider<Either<Failure, UserQuestionEntity>>((ref) async {
  final repo = ref.watch(userQuestionRepositoryProvider);
  return await repo.getUserQuestion();
});
