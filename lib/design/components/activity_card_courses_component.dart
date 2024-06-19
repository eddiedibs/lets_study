import 'package:flutter/material.dart';
import 'package:lets_study_flutter/design/components/activity_card_progress_component.dart';

class CoursesComponent extends StatefulWidget {
  final List<Map<String,dynamic>> courses;

  CoursesComponent({
    required this.courses,
  });

  @override
  CoursesComponentState createState() => CoursesComponentState();
}
class CoursesComponentState extends State<CoursesComponent> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          for (var item in widget.courses)
          ...[
              Text(
                item["courseName"]?? "",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  color: const Color.fromARGB(255, 255, 255, 255) == Colors.white ? Colors.black : Colors.white,
                ),
              ),
              ProgressComponent(
                progressComponentType: ProgressComponentType.linear,
                progress: item["courseProgress"]?? 0,
                addProgressPercentage: false,
                progressColor: const Color.fromARGB(255, 238, 116, 113),
                progressBgColor: const Color.fromARGB(255, 255, 255, 255),
              )
          ]
            
          ],
        );
                
  }


}