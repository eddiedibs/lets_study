import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_study_flutter/logic/cubit/quiz_cubit.dart';
import 'package:lets_study_flutter/design/custom_app_bar.dart';
import 'package:lets_study_flutter/design/custom_bottom_app_bar.dart';


class Quiz {
  final Map<String, Object> questionsAndAnswers;

  Quiz({required this.questionsAndAnswers});

  Object get question => questionsAndAnswers["question"]!;
  Object get answer => questionsAndAnswers["answer"]!;
  Object get correctAnswerPos => questionsAndAnswers["correctAnswerPos"]!;
}


class QuizWidgetPage extends StatefulWidget {
  @override
  _QuizWidgetPageState createState() => _QuizWidgetPageState();

}

class _QuizWidgetPageState extends State<QuizWidgetPage> {
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Mis Quizzes", isHomePage: false),
      body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is QuizSuccess) {
              var quizzes = state.quizzes; // Use the quizzes property from QuizSuccess state
              return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                        children: quizzes.map((quizItem) {
                          var answers = quizItem.answer as List<String>;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                quizItem.question.toString(),
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                            ...List.generate(answers.length, (index) {
                                return RadioListTile<int>(
                                  title: Text(answers[index]),
                                  value: index,
                                  groupValue: _selectedValue,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedValue = value;
                                    });
                                  },
                                );
                              }),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    final snackBar = SnackBar(
                                      content: Text(
                                        _selectedValue == quizItem.correctAnswerPos
                                            ? 'Correcto!'
                                            : 'Incorrecto!',
                                      ),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  },
                                  child: Text('Enviar Respuesta'),
                                ),
                              ),
                              SizedBox(height: 20),
                              
                            ],
                          );
                        }).toList(),
                      )
                    ) 
                  );
            } else if (state is QuizFailure) {
              // Handle failure state
              return Text('Failed to load quizzes');
            } else if (state is QuizEmpty) {
              // Handle failure state
              return const Text(
                  "No hay quizzes pendientes.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    color: Colors.black,
                      ),
                    );
            } else {
              return Text('Unknown state');
            }
          }),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}