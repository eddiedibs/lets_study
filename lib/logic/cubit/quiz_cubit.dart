import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_study_flutter/presentation/screens/quiz_widget.dart';
import 'package:equatable/equatable.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizLoading());

  void addQuiz(Quiz quiz) {
    final updatedQuizzes = [quiz];
    emit(QuizSuccess(updatedQuizzes));
  }
}