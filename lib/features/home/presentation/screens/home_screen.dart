import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbti/features/auth/auth_provider.dart';

final futureProvider = FutureProvider<int>((ref) {
  return Future.delayed(const Duration(seconds: 3), () => 5);
});

final streamProvider = StreamProvider<int>((ref) {
  int count = 0;
  return Stream.periodic(const Duration(seconds: 2), (_) => count++);
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            try {
              ref.read(authControllerProvider.notifier).signOut();
            } catch (e) {
              log(e.toString());
            }
          },
          child: const Text('로그 아웃'),
        ),
      ),
    );
  }
}
