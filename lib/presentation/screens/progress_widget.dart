import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:lets_study_flutter/design/custom_app_bar.dart';
import 'package:lets_study_flutter/design/components/activity_card_progress_component.dart';
import 'package:lets_study_flutter/logic/cubit/course_cubit.dart';

class ProgressWidgetPage extends StatefulWidget {
  static const routeName = '/progress-page';

  @override
  _ProgressWidgetPageState createState() => _ProgressWidgetPageState();
}

class _ProgressWidgetPageState extends State<ProgressWidgetPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  List<bool> _isCheckedList = []; // Initialize with appropriate size or empty

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.linear);
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Progreso Interactivo", isHomePage: false),
      body: Center(
        child: ScaleTransition(
          scale: _animation!,
          child: BlocBuilder<CourseCubit, CourseState>(
              builder: (context, state) {
                if (state is CourseLoaded) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GridView.builder(
                      itemCount: state.courses.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two columns
                        crossAxisSpacing: 8, // Space between items horizontally
                        mainAxisSpacing: 8, // Space between items vertically
                        childAspectRatio: 3 / 2, // Aspect ratio of each item (width / height)
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        // Access each course item and render it
                        var courseItem = state.courses[index];
                        if (_isCheckedList.length != state.courses.length) {
                          _isCheckedList = List<bool>.filled(state.courses.length, false);
                        }
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), 
                            child: Container(
                              height: 150,
                              width: 200,
                              color: courseItem.widgetColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Transform.scale(
                                      scale: 1.3,
                                      child: Checkbox(
                                        checkColor: courseItem.widgetColor,
                                        activeColor: Colors.white,
                                        side: const BorderSide(color: Colors.white, width: 2),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        value: _isCheckedList[index],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isCheckedList[index] = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 12.0),
                                      child: Text(
                                      courseItem.courseName,
                                      style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )
                                      )

                                    ]),
                                    ProgressComponent(
                                    progressComponentType: ProgressComponentType.linear,
                                    progress: courseItem.courseProgress,
                                    addProgressPercentage: false,
                                    progressColor: Colors.white,
                                    progressBgColor: Colors.red[200] ?? Colors.red,
                                  )
                                  ]))
                              ), 
                      );
                      },
                    ));


                } else {
                  return Container();
                }
              }
          ),


          
          // CircularPercentIndicator(
          //   radius: 100.0,
          //   lineWidth: 10.0,
          //   animation: true,
          //   percent: 0.7,
          //   center: Text(
          //     "70%",
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          //   ),
          //   footer: Text(
          //     "Progreso del Curso",
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          //   ),
          //   circularStrokeCap: CircularStrokeCap.round,
          //   progressColor: Colors.blue,
          // ),
        ),
      ),
    );
  }
}
