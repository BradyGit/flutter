import 'package:flutter/material.dart';
import 'package:mbti/features/auth/presentation/widgets/sign_in_with_google_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SignInWithGoogleButton()),
    );
  }
}
