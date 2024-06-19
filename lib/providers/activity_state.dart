
part of 'activity_cubits.dart';

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

class Activity {
  final ActivityCard activityCard;
  // final String title;
  // final Color color;
  // final double? progress;
  // final Color? progressColor;
  // final Color? progressBgColor;
  // final String? imgUrl;
  // final String? cardTitle;
  // final String? cardDescription;
  // final IconData icon;

  Activity({
    required this.activityCard,
    // required this.title,
    // required this.color,
    // this.progressColor,
    // this.progressBgColor,
    // this.imgUrl,
    // this.cardTitle,
    // this.cardDescription,
    // required this.icon,
  });
}
