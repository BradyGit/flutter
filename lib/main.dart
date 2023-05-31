import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mbti/router/router.dart';
import 'package:mbti/styles/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  log('main');

  runApp(
    ProviderScope(
      child: MaterialApp.router(
        theme: theme,
        routerConfig: router,
      ),
    ),
  );
}
