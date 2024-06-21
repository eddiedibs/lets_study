import 'package:flutter/material.dart';

class QuizzesComponent extends StatefulWidget {
  final List<Map<String,dynamic>> quizzes;

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
      children: [
          for (var item in widget.quizzes)
          ...[
              Text(
                item["quizzName"]?? "",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  color: const Color.fromARGB(255, 255, 255, 255) == Colors.white ? Colors.black : Colors.white,
                ),
              ),
          ]
            
          ],
        );
                
  }


}