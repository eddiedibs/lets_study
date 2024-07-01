
part of 'course_cubit.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoaded extends CourseState {
  final List<Course> courses;

  const CourseLoaded(this.courses);

  @override
  List<Object> get props => [courses];
}


class Course {
  final String courseName;
  final int assignmentsDue;
  final double courseProgress;
  final Color widgetColor;


  Course({
    required this.courseName,
    required this.assignmentsDue,
    required this.courseProgress,
    required this.widgetColor,

  });
}
