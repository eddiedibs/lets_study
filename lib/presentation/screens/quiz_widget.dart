import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_study_flutter/logic/cubit/quiz_cubit.dart';
import 'package:lets_study_flutter/design/custom_app_bar.dart';


class Quiz {
  final List<Map<String, String>> questionsAndAnswers;

  Quiz({required this.questionsAndAnswers});
}

class QuizWidgetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "My Activity", isHomePage: false),
      body: BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is QuizSuccess) {
          // Handle success state, e.g., display quizzes
          return Text('Quizzes Loaded');
        } else if (state is QuizFailure) {
          // Handle failure state
          return Text('Failed to load quizzes');
        } else {
          return Text('Unknown state');
        }
      },
    ),
    );
  }
}
