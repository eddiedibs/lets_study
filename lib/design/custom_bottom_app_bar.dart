import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lets_study_flutter/logic/cubit/quiz_cubit.dart';
import 'package:lets_study_flutter/design/quiz_dialog.dart';

class CustomBottomAppBar extends StatefulWidget {
  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();

}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
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
                            content: QuizDialog(),
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
