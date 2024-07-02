import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_study_flutter/logic/cubit/quiz_cubit.dart';
import 'package:lets_study_flutter/design/custom_app_bar.dart';
import 'package:lets_study_flutter/design/custom_bottom_app_bar.dart';

// Clase para representar un Quiz
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
  int? _selectedValue; // Variable para almacenar el valor seleccionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Mis Quizzes", isHomePage: false), // Barra superior personalizada
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizSuccess) {
            var quizzes = state.quizzes; // Utiliza la propiedad quizzes del estado QuizSuccess
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
                          quizItem.question.toString(), // Muestra la pregunta del quiz
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        ...List.generate(answers.length, (index) {
                          return RadioListTile<int>(
                            title: Text(answers[index]), // Opción de respuesta del quiz
                            value: index,
                            groupValue: _selectedValue,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedValue = value; // Actualiza el valor seleccionado
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
                                      ? 'Correcto!' // Mensaje si la respuesta es correcta
                                      : 'Incorrecto!', // Mensaje si la respuesta es incorrecta
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar); // Muestra el SnackBar con el resultado
                            },
                            child: Text('Enviar Respuesta'), // Botón para enviar respuesta
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          } else if (state is QuizFailure) {
            return Text('Error al cargar quizzes'); // Maneja el estado de falla
          } else if (state is QuizEmpty) {
            return const Text(
              "No hay quizzes pendientes.", // Mensaje cuando no hay quizzes disponibles
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20,
                color: Colors.black,
              ),
            );
          } else {
            return Text('Estado desconocido'); // Estado desconocido
          }
        },
      ),
      bottomNavigationBar: CustomBottomAppBar(), // Barra de navegación inferior personalizada
    );
  }
}
