import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbti/features/common/presentation/widgets/app_error.dart';
import 'package:mbti/features/mbti/domain/entities/question_entity.dart';
import 'package:mbti/features/mbti/mbti_provider.dart';
import 'package:mbti/features/mbti/presentation/widgets/question_wdiget.dart';
import 'package:mbti/features/user/user_question_provider.dart';

class QuestionsScreen extends ConsumerWidget {
  QuestionsScreen({super.key});

  final _pageIndexProvider = StateProvider<int>((ref) => 1);

  PageController _pageController = PageController(initialPage: 0);

  bool _initialized = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(questionsListControllerProvider);
    log('QuestionsScreen build');
    return Scaffold(
      appBar: AppBar(),
      body: questions.when(
        data: (questions) {
          _initialize(ref, questions);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text('${ref.watch(_pageIndexProvider)}/${questions.length}'),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return QuestionCard(questionEntity: questions[index], next);
                  },
                  onPageChanged: (value) {
                    ref.read(_pageIndexProvider.notifier).state = value + 1;
                  },
                ),
              ),
            ],
          );
        },
        error: (o, e) => AppError(
          title: o.toString(),
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }

  _initialize(WidgetRef ref, List<QuestionEntity> questions) async {
    log('_initialize : $_initialized');
    if (_initialized) return;
    _initialized = true;
    final user = ref.read(userQuestionUpdateControllerProvider);
    user.when(
      data: (data) {
        String? lastQuestionId = data.currentQuestionId;
        log('lastQuestionId: $lastQuestionId');
        if (lastQuestionId.isNotEmpty) {
          var position =
          questions.indexWhere((element) => element.id == lastQuestionId);
          log('position: $position');
          _pageController = PageController(initialPage: position + 1);
          /// 위젯이 생성되는 동안 provider.read 는 허락되지 않는다...
          /// 1. 프로바이더 수정을 위젯 라이프 사이클 외부로 이동.
          /// 2. Delay...
          /// 추천은 1번이지만... 외부로 변경할수 없어서.. 2번으로
          Future.delayed(const Duration(microseconds: 300), () {
            ref.read(_pageIndexProvider.notifier).state = position + 2;
          });
        }
      },
      error: (o, e) {},
      loading: () {},
    );
  }

  next(WidgetRef ref, QuestionEntity questionEntity, int? score) {
    final int nextPage;
    if (_pageController.page != null) {
      nextPage = _pageController.page!.toInt() + 1;
    } else {
      nextPage = 0;
    }
    ref
        .read(userQuestionUpdateControllerProvider.notifier)
        .update(questionEntity.id);
    _pageController.jumpToPage(nextPage);
  }
}
