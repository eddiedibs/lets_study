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
    // Simula el cargar los quizzes de Mis Quizzes, se puede obtener la data a partir de llamados de API desde aqui
    final Map<String, String> myQuiz = {}; 
    if (myQuiz.isEmpty){
      emit(QuizEmpty()
      );
    }
    
  }

}