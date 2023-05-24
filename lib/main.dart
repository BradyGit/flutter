import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mbti/router/router.dart';
import 'package:mbti/styles/theme.dart';

void main() {
  log('main');
  runApp(MaterialApp.router(
    theme: theme,
    routerConfig: router,
  ));
}
