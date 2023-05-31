import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final streamAsyncValue = ref.watch(streamProvider);

    final futureAsyncValue = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: streamAsyncValue.when(
              data: (data) => Text('Value: $data'),
              loading: () => const CircularProgressIndicator(),
              error: (e, st) => Text('Error: $e'),
            ),
          ),
          Center(
            child: futureAsyncValue.when(
              data: (data) => Text('Value: $data'),
              loading: () => const CircularProgressIndicator(),
              error: (e, st) => Text('Error: $e'),
            ),
          ),
        ],
      ),
    );
  }
}
