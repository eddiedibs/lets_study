import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lets_study_flutter/design/components/activity_card_progress_component.dart';
import 'package:lets_study_flutter/design/components/activity_card_education_component.dart';
import 'package:lets_study_flutter/design/activity_card.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(ActivityInitial());

  void loadActivities() {
    // Simula el cargar los elementos de Mi Actividad, se puede obtener la data a partir de llamados de API desde aqui
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
          color: const Color.fromARGB(255, 255, 255, 255),
          widgetComponent: const [],
          iconColor: const Color.fromARGB(255, 237, 112, 110),
          icon: Icons.question_answer,
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

}
