import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mbti/features/mbti/domain/entities/question_entity.dart';

class QuestionCard extends ConsumerWidget {
  const QuestionCard(this.next, {Key? key, required this.questionEntity})
      : super(key: key);

  final QuestionEntity questionEntity;
  final Function(WidgetRef ref, QuestionEntity questionEntity, int? score) next;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                questionEntity.description,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => next(ref, questionEntity, 40),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 150),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.red),
                      child: const Text(''),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => next(ref, questionEntity, 20),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(125, 125),
                        shape: const CircleBorder(),
                        backgroundColor: Colors.red.withOpacity(0.5),
                      ),
                      child: const Text(''),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => next(ref, questionEntity, null),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 100),
                        shape: const CircleBorder(),
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      ),
                      child: const Text(''),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => next(ref, questionEntity, 20),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(125, 125),
                        shape: const CircleBorder(),
                        backgroundColor: Colors.blue.withOpacity(0.5),
                      ),
                      child: const Text(''),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => next(ref, questionEntity, 40),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 150),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.blue),
                      child: const Text(''),
                    ),
                  ),
                ],
              )
              // Flex(
              //   direction: Axis.horizontal,
              //   children: [Text(questionEntity.description)],
              // ),
              // Expanded(
              //   flex: 1,
              //   child: Text(questionEntity.description),
              // ),
              // Flexible(
              //   flex: 1,
              //   fit: FlexFit.tight,
              //   child: Text(questionEntity.description),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
