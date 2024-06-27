import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lets_study_flutter/design/components/activity_card_progress_component.dart';
import 'package:lets_study_flutter/design/components/activity_card_education_component.dart';
import 'package:lets_study_flutter/design/components/activity_card_quizzes_component.dart';
import 'package:lets_study_flutter/design/activity_card.dart';

part 'activity_state.dart';

// enum activityType { education, loading }
class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(ActivityInitial());

  void loadActivities() {
    // Simulate loading activities, you can fetch data from API or database here
    emit(ActivityLoaded([
      Activity(
        activityCard:ActivityCard(
          title: 'Progreso',
          titleSize: 24,
          color: const Color.fromARGB(255, 38, 46, 92),
          widgetComponent: [
            ProgressComponent(
              progressComponentType: ProgressComponentType.circle,
              progress: 0.7,
              addProgressPercentage: true,
              progressColor: const Color.fromARGB(255, 248, 34, 156),
              progressBgColor: const Color.fromARGB(255, 60, 69, 110),
            )
          ],
          iconColor: const Color.fromARGB(255, 248, 34, 156),
          icon: Icons.local_fire_department,
          route: "/progress-page",
        )
        
      ),
      Activity(
        activityCard:ActivityCard(
          title: 'Quizzes',
          titleSize: 24,
          color: const Color.fromARGB(255, 38, 46, 92),
          widgetComponent: [
            QuizzesComponent(
              quizzes: [{"Quiz1": ""}],
            )
          ],
          iconColor: const Color.fromARGB(255, 248, 34, 156),
          icon: Icons.local_fire_department,
          route: "/quiz-page",
        )
      ),
      Activity(
        activityCard: ActivityCard(
          title: 'Perfil',
          titleSize: 15,
          color: Color.fromARGB(255, 255, 255, 255),
          widgetComponent: [
            EducationComponent(
              imgUrl: "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
              cardTitle: "John Doe",
              cardTitleSize: 20,
              cardDescription: "Estudiante de ingeniería de software",
            )
          ],
          iconColor: const Color.fromARGB(255, 52, 164, 255),
          icon: Icons.person,
          route: "/education-card-page",
        )
      ),
    ]));
  }

  // void loadActivity(activityType activityTypeInput) {
  //   // Simulate loading activities, you can fetch data from API or database here
  //   switch (activityTypeInput) {
  //       case activityType.education:
  //           emit(ActivityComponentLoaded([
  //             EducationComponent(
  //                     imgUrl: "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
  //                     cardTitle: "John Doe",
  //                     cardTitleSize: 20,
  //                     cardDescription: "Estudiante de ingeniería de software",
  //             )
  //           ]));
  //       break;
  //       case activityType.loading:
  //       break;
  //     }

  // }
}
