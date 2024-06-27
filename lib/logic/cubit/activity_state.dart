
part of 'activity_cubit.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityInitial extends ActivityState {}

class ActivityLoaded extends ActivityState {
  final List<Activity> activities;

  const ActivityLoaded(this.activities);

  @override
  List<Object> get props => [activities];
}

// class ActivityComponentLoaded extends ActivityState {
//   final List<Object> activityComponent;

//   const ActivityComponentLoaded(this.activityComponent);

//   @override
//   List<Object> get props => [activityComponent];
// }

class Activity {
  final ActivityCard activityCard;


  Activity({
    required this.activityCard,

  });
}
