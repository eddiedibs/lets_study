import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  void loadCourses() {
    // Simulate loading activities, you can fetch data from API or database here
    emit(CourseLoaded([
      Course(
          courseName: "French",
          assignmentsDue: 3,
          courseProgress: 0.7,
          widgetColor: Colors.red
        ),
      Course(
          courseName: "Spanish",
          assignmentsDue: 5,
          courseProgress: 0.5,
          widgetColor: Colors.blue
        ),
      Course(
          courseName: "Calculus",
          assignmentsDue: 5,
          courseProgress: 0.5,
          widgetColor: Colors.yellow
        )
      ]
    ));
  }
}
