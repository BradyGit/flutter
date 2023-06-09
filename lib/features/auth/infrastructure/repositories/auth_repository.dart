import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:mbti/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:mbti/features/auth/infrastructure/datasources/local/auth_token_local_data_source.dart';
import 'package:mbti/features/common/domain/failures/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../domain/entities/user_entity.dart';

/// 인증과 세션을 관리하는 repository
class AuthRepository implements AuthRepositoryInterface {
  AuthRepository(this.authTokenLocalDataSource, this.authClient);

  /// SharedPreferences 에 저장된 세션 토큰.
  final AuthTokenLocalDataSource authTokenLocalDataSource;

  final supabase.GoTrueClient authClient;

  /// 로그인된 supabase 사용자 정보.
  UserEntity? get currentUser => authClient.currentUser == null
      ? null
      : UserEntity.fromJson(authClient.currentUser!.toJson());

  /// 사용자의 로그인 상태 정보 콜백 등록하는 함수.
  @override
  void authStateChange(
    void Function(UserEntity? userEntity) callback,
  ) {
    authClient.onAuthStateChange.listen((event) {
      switch (event.event) {
        case supabase.AuthChangeEvent.signedIn:
          callback(
            UserEntity.fromJson(event.session!.user.toJson()),
          );
        case supabase.AuthChangeEvent.signedOut:
          callback(null);
        case supabase.AuthChangeEvent.userUpdated:
          callback(
            UserEntity.fromJson(event.session!.user.toJson()),
          );
        case supabase.AuthChangeEvent.passwordRecovery:
        case supabase.AuthChangeEvent.tokenRefreshed:
        case supabase.AuthChangeEvent.userDeleted:
        case supabase.AuthChangeEvent.mfaChallengeVerified:
          break;
      }
    });
    authClient.onAuthStateChange.listen((event) {
      switch (event.event) {
        case supabase.AuthChangeEvent.signedIn:
          callback(
            UserEntity.fromJson(event.session!.user.toJson()),
          );
        case supabase.AuthChangeEvent.signedOut:
          callback(null);
        case supabase.AuthChangeEvent.userUpdated:
          callback(
            UserEntity.fromJson(event.session!.user.toJson()),
          );
        case supabase.AuthChangeEvent.passwordRecovery:
        case supabase.AuthChangeEvent.tokenRefreshed:
        case supabase.AuthChangeEvent.userDeleted:
        case supabase.AuthChangeEvent.mfaChallengeVerified:
          break;
      }
    });
  }

  ///
  @override
  Future<Either<Failure, UserEntity>> setSession(String token) async {
    final response = await authClient.setSession(token);
    await authTokenLocalDataSource
        .store(response.session?.persistSessionString ?? '');

    final user = response.user;

    if (user == null) {
      await authTokenLocalDataSource.remove();
      return left(const Failure.unauthorized());
    }

    return right(UserEntity.fromJson(user.toJson()));
  }

  /// Recovers session from local storage and refreshes tokens
  @override
  Future<Either<Failure, UserEntity>> restoreSession() async {
    final res = authTokenLocalDataSource.get();
    if (res.isLeft()) {
      /// 로컬어 저장된 사용자 정보가 없으면 세션 복구 실패.
      return left(const Failure.empty());
    }

    /// 로컬에 저장된 세션정보로 supabase 사용자 정보 찔러 보기.
    final response = await authClient.recoverSession(res.getOrElse((_) => ''));
    final user = response.user;

    if (user == null) {
      /// supabase에 사용자 정보가 없으면 로컬 세션도 삭제하고 세션 복구 실패.
      await authTokenLocalDataSource.remove();
      return left(const Failure.unauthorized());
    }

    /// 최신 세션 로컬에 저장.
    await authTokenLocalDataSource
        .store(response.session?.persistSessionString ?? '');

    /// 세션 복구 성공.
    return right(UserEntity.fromJson(user.toJson()));
  }

  /// Signs in user to the application
  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    log('here2');
    final signedIn = await authClient.signInWithOAuth(
      supabase.Provider.google,
    );
    if (!signedIn) {
      return left(const Failure.badRequest());
    }
    return right(true);
  }

  /// Signs out user from the application
  @override
  Future<Either<Failure, bool>> signOut() async {
    await authTokenLocalDataSource.remove();

    try {
      await authClient.signOut();
      return right(true);
    } catch (e) {
      return left(const Failure.badRequest());
    }
  }
}
