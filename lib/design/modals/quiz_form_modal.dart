// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lets_study_flutter/cubits/quiz_cubit.dart';
// import 'package:lets_study_flutter/widgets/quiz_widget.dart';
// import 'package:lets_study_flutter/design/custom_app_bar.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// class QuizFormPage extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(titleText: "Create Quiz", isHomePage: false),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showDialog(s
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   content: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         TextFormField(
//                           decoration: InputDecoration(labelText: "Question"),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a question';
//                             }
//                             return null;
//                           },
                          
//                         ),
//                         TextFormField(
//                           decoration: InputDecoration(labelText: "Answer"),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter a answer';
//                             }
//                             return null;
//                           },
                          
//                         ),
//                         // Repeat TextFormField for each question and answer
//                         ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               var quiz = Quiz(
//                                 questions: ["Your Question Here"],
//                                 answers: ["Your Answer Here"],
//                               );
//                               Modular.get<QuizCubit>().addQuiz(quiz);
//                               Navigator.of(context).pop();
//                             }
//                           },
//                           child: Text("Submit"),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//           child: Text('Add Quiz'),
//         ),
//       ),
//     );
//   }
// }
