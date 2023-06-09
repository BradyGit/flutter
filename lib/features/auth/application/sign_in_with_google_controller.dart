import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbti/features/auth/auth_provider.dart';

class SignInWithGoogleController extends StateNotifier<bool> {
  SignInWithGoogleController(this._ref) : super(false);
  final Ref _ref;

  Future<void> signInWithGoogle() async {
    await _ref.read(authRepositoryProvider).signInWithGoogle();
  }
}
