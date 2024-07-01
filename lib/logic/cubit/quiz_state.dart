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

class OptionSelected extends QuizState {
  final int? selectedOption;

  OptionSelected(this.selectedOption);

  @override
  List<Object?> get props => [selectedOption];
}

class QuizSuccess extends QuizState {
  final List<Quiz> quizzes;
  final int? selectedOption;

  QuizSuccess(this.quizzes, this.selectedOption);

  @override
  List<Quiz> get props => quizzes;

  int? get selected => selectedOption;


}

class QuizFailure extends QuizState {
  @override
  List<Object?> get props => []; 
}
