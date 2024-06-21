part of 'quiz_cubit.dart';


abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizSuccess extends QuizState {
  final List<Object> quizzes;

  QuizSuccess(this.quizzes);

  @override
  List<Object> get props => [quizzes];
}

class QuizFailure extends QuizState {}
