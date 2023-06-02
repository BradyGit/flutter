import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mbti/features/auth/auth_provider.dart';
import 'package:mbti/features/auth/presentation/screens/auth_screen.dart';
import 'package:mbti/features/home/presentation/screens/home_screen.dart';
import 'package:mbti/features/mbti/presentation/screens/details_screen.dart';

final GoRouter router = GoRouter(
  /// url path 형식의 화면 구조 구성.
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => const AuthScreen(),
    ),
  ],
  redirect: (context, state) {
    /// 화면 이동시 로그인 상태 체크
    final loggedIn = authStateListenable.value;
    state.location.contains('/auth');
    final goingToLogin = state.location.contains('/auth');
    if (!loggedIn && !goingToLogin) {
      return '/auth';
    }
    if (loggedIn && goingToLogin) return '/';
    return null;
  },

  /// 로그인 상태가 변경되면 router 초기화. redirect 블록이 실행될테지.
  refreshListenable: authStateListenable,
  debugLogDiagnostics: true,
);
