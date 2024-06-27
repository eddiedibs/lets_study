import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(EducationInitial());

  void loadEducation() {
    // Simulate loading activities, you can fetch data from API or database here
    emit(EducationLoaded(
        Education( 
        imgUrl: "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
        cardTitle: "John Doe",
        cardTitleSize: 20,
        cardDescription: "Estudiante de ingeniería de software",
      )
    ));
  }
}
