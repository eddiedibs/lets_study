import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lets_study_flutter/logic/cubit/quiz_cubit.dart';
import 'package:lets_study_flutter/presentation/screens/quiz_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomAppBar extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  late Map<String, Object> questionsAndAnswers = {};
  final questionController = TextEditingController();
  final answerController1 = TextEditingController();
  final answerController2 = TextEditingController();
  final answerController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                        color: const Color.fromARGB(255, 240, 241, 245),
                        borderRadius: BorderRadius.circular(50), // Adjust the value to change the roundness
                      ),
                ), 
                SizedBox(
                  width: 100.0, // Adjust the size as needed
                  height: 100.0, // Adjust the size as needed
                  child: IconButton(
                    icon: Icon(Icons.school),
                    onPressed: () {
                      // route placeholder 
                    },
                  ), 
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(50), // Adjust the value to change the roundness
                      ),
                ), 
                SizedBox(
                  width: 100.0, // Adjust the size as needed
                  height: 100.0, // Adjust the size as needed
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return BlocProvider.value(
                              value: BlocProvider.of<QuizCubit>(context),
                              child: AlertDialog(
                            content: Form(
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
                                  // Repeat TextFormField for each question and answer
                                  ElevatedButton(
                                    onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        questionsAndAnswers = {'question': questionController.text,'answer': [answerController1.text,answerController2.text,answerController3.text]};

                                        var quiz = Quiz(questionsAndAnswers: questionsAndAnswers);
                                        Modular.get<QuizCubit>().addQuiz(quiz);
                                        Modular.to.pushNamed("/quiz-page");

                                      }
                                    },
                                    child: Text("Submit"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                            );
                          },
                        );
                   }
                  ),
                )
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        color: const Color.fromARGB(255, 240, 241, 245),
                        borderRadius: BorderRadius.circular(50), // Adjust the value to change the roundness
                      ),
                ), 
                SizedBox(
                  width: 100.0, // Adjust the size as needed
                  height: 100.0, // Adjust the size as needed
                  child: IconButton(
                    icon: Icon(Icons.book),
                    onPressed: () {
                      // route placeholder 
                    },
                  ), 
                ),
              ],
            ),
          ],
      );
    
  }


}
