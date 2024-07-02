import 'package:flutter/material.dart';

import 'package:lets_study_flutter/logic/cubit/quiz_cubit.dart';
import 'package:lets_study_flutter/presentation/screens/quiz_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';


class QuizDialog extends StatefulWidget {
  @override
  _QuizDialogState createState() => _QuizDialogState();
}

class _QuizDialogState extends State<QuizDialog> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, Object> questionsAndAnswers = {};
  final questionController = TextEditingController();
  final answerController1 = TextEditingController();
  final answerController2 = TextEditingController();
  final answerController3 = TextEditingController();
  int? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                  TextFormField(
                  controller: questionController,
                  decoration: InputDecoration(labelText: "Question"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a question';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: answerController1,
                  decoration: InputDecoration(labelText: "Answer"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a answer';
                    }
                    return null;
                  },
                  
                ),
                RadioListTile<int>(
                  title: Text("Correcta"),
                  value: 0,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                  },
                ),
                TextFormField(
                  controller: answerController2,
                  decoration: InputDecoration(labelText: "Answer"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a answer';
                    }
                    return null;
                  },
                  
                ),
                RadioListTile<int>(
                  title: Text("Correcta"),
                  value: 1,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                  },
                ),
                TextFormField(
                  controller: answerController3,
                  decoration: InputDecoration(labelText: "Answer"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a answer';
                    }
                    return null;
                  },
                  
                ),
                RadioListTile<int>(
                  title: Text("Correcta"),
                  value: 2,
                  groupValue: _selectedValue,
                  onChanged: (int? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                      if (_formKey.currentState!.validate() && _selectedValue != null) {
                        // Guarda el estado del formulario
                        _formKey.currentState!.save();
                        questionsAndAnswers = {'question': questionController.text,'answer': [answerController1.text,answerController2.text,answerController3.text], "correctAnswerPos": _selectedValue!};

                        // Crea instancia de Quiz
                        var quiz = Quiz(questionsAndAnswers: questionsAndAnswers);
                        // Se agrega la instancia de Quiz al QuizCubit
                        Modular.get<QuizCubit>().addQuiz(quiz);
                        // Se redirecciona a la ruta
                        Modular.to.pushNamed("/quiz-page");

                    }
                  },
                  child: Text("Enviar"),
                ),
              ],
            ),
          );
  }
}
