import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbti/features/auth/auth_provider.dart';

class SignInWithGoogleButton extends ConsumerWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        try {
          ref.read(signInWithGoogleProvider.notifier).signInWithGoogle();
        } catch (e) {
          log(e.toString());
        }
      },
      child: const Text('구글 로그인'),
    );
  }
}
