
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        actions: [
          IconButton(onPressed: () {
            ref.read(authControllerProvider.notifier).signOut();
            }, icon: const Icon(Icons.logout_outlined),),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigator 정의.
                context.push('/questions');
              },
              child: const Text('테스트 시작'),
            ),
          ),
        ],
      ),
    );
  }
}
