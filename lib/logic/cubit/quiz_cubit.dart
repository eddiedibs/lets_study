import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_study_flutter/presentation/screens/quiz_widget.dart';
import 'package:equatable/equatable.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizLoading());

  void addQuiz(Quiz quiz) {
      final currentState = state;
      if (currentState is QuizSuccess) {
        final updatedQuizzes = List<Quiz>.from(currentState.quizzes)..add(quiz);
        emit(QuizSuccess(updatedQuizzes));
      } else {
        emit(QuizSuccess([quiz]));
      }
    }


  void loadQuizzes() {
    // Simulate loading loadQuizzes, you can fetch data from API or database here
    final Map<String, String> myQuiz = {}; 
    if (myQuiz.isEmpty){
      emit(QuizEmpty()
      );
    }
    
  }

}