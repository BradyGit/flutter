import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbti/features/auth/auth_provider.dart';
import 'package:mbti/features/auth/domain/entities/user_entity.dart';
import 'package:mbti/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:uni_links/uni_links.dart';

class AuthController extends StateNotifier<UserEntity?> {

  AuthController(this._ref) : super(null) {
    _initialize();
  }
  final Ref _ref;
  AuthRepository get _repository => _ref.read(authRepositoryProvider);

  Future<void> _initialize() async {
    /// 로그인 세션 체크
    final res = await _repository.restoreSession();
    state = res.fold((l) => null, (r) => r);
    _updateAuthState();
    if (state == null) {
      /// 딥링크로 전달된 세션을 저장.
      await _handleInitialDeepLink();
    }

    /// 로그인 세션 변경체크.
    _repository.authStateChange((user) {
      state = user;
      _updateAuthState();
    });
  }

  /// 로그인 상태 업데이트.
  void _updateAuthState() {
    authStateListenable.value = state != null;
  }

  /// 로그 아웃
  Future<void> signOut() async {
    await _repository.signOut();
  }

  /// 구글 로그인 완료후 실행될 deeplink에서 토큰 저장.
  Future<void> _handleInitialDeepLink() async {
    /// 딥링크에 토큰 추출.
    final initialLink = await getInitialLink();
    if (!(initialLink?.contains('refresh_token=') ?? false)) {
      return;
    }

    final refreshTokenQueryParam = initialLink
        ?.split('&')
        .firstWhere((element) => element.contains('refresh_token'));

    /// 토큰 추출
    final refreshToken = refreshTokenQueryParam
        ?.substring(refreshTokenQueryParam.indexOf('=') + 1);
    if (refreshToken == null) return;

    /// 토큰저장.
    final res = await _repository.setSession(refreshToken);
    state = res.fold((l) => null, (r) => r);
    _updateAuthState();
  }

}
