import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbti/features/auth/application/auth_controller.dart';
import 'package:mbti/features/auth/domain/entities/user_entity.dart';
import 'package:mbti/features/auth/infrastructure/datasources/local/auth_token_local_data_source.dart';

import '../../config/providers.dart';
import 'application/sign_in_with_google_controller.dart';
import 'infrastructure/repositories/auth_repository.dart';

/// 로그인 상태값 ValueNotifier
final authStateListenable = ValueNotifier<bool>(false);

/// 구글 로그인 여부 상태 제공
final signInWithGoogleProvider =
    StateNotifierProvider<SignInWithGoogleController, bool>((ref) {
  return SignInWithGoogleController(ref);
});

/// 로그인 상태 제공.
final authControllerProvider =
    StateNotifierProvider<AuthController, UserEntity?>((ref) {
  return AuthController(ref);
});

/// 세센 토큰 저장, 복구, 읽기를 관리할 AuthRepository 제공.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authClient = ref.watch(supabaseClientProvider).auth;
  final prefs = ref.read(sharedPreferencesProvider).asData!.value;
  return AuthRepository(
    AuthTokenLocalDataSource(
      prefs,
    ),
    authClient,
  );
});
