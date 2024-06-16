import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lets_study_flutter/providers/quiz_provider.dart';

class QuizWidgetPage extends StatelessWidget {
  static const routeName = '/quiz-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Personalizado'),
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, _) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pregunta: ¿Cuál es la capital de Francia?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              RadioListTile<int>(
                title: Text('Berlín'),
                value: 0,
                groupValue: quizProvider.selectedOption,
                onChanged: (int? value) {
                  quizProvider.setSelectedOption(value!);
                },
              ),
              RadioListTile<int>(
                title: Text('Madrid'),
                value: 1,
                groupValue: quizProvider.selectedOption,
                onChanged: (int? value) {
                  quizProvider.setSelectedOption(value!);
                },
              ),
              RadioListTile<int>(
                title: Text('París'),
                value: 2,
                groupValue: quizProvider.selectedOption,
                onChanged: (int? value) {
                  quizProvider.setSelectedOption(value!);
                },
              ),
              RadioListTile<int>(
                title: Text('Lisboa'),
                value: 3,
                groupValue: quizProvider.selectedOption,
                onChanged: (int? value) {
                  quizProvider.setSelectedOption(value!);
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text(
                        quizProvider.selectedOption == 2
                            ? 'Correcto!'
                            : 'Incorrecto!',
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('Enviar Respuesta'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
