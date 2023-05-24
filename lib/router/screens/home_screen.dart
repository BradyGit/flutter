import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('HomeScreen');
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: double.infinity,
      child: const Text('Home Screen'),
    );
  }
}
