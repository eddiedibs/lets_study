import 'package:flutter/material.dart';
import 'package:lets_study_flutter/presentation/screens/quiz_widget.dart';

class QuizzesComponent extends StatefulWidget {
  // final List<Map<String,dynamic>> quizzes;
  final List<Quiz> quizzes;

  QuizzesComponent({
    required this.quizzes,
  });

  @override
  QuizzesComponentState createState() => QuizzesComponentState();
}
class QuizzesComponentState extends State<QuizzesComponent> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          for (var item in widget.quizzes)
          ...[
              Text(
                item.question.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  color: const Color.fromARGB(255, 60, 69, 110) == Colors.white ? Colors.black : Colors.white,
                ),
              ),
          ]
            
          ],
        );
                
  }


}