part of 'quiz_cubit.dart';


abstract class QuizState extends Equatable {
  
}

class QuizInitial extends QuizState {
    @override
  List<Object?> get props => []; 
}

class QuizLoading extends QuizState {
    @override
  List<Object?> get props => []; 
}

class QuizSuccess extends QuizState {
  final List<Quiz> quizzes;

  QuizSuccess(this.quizzes);

  @override
  List<Quiz> get props => quizzes;


}

class QuizFailure extends QuizState {
  @override
  List<Object?> get props => []; 
}
