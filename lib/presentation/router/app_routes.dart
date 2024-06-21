import 'package:flutter_modular/flutter_modular.dart';
import 'package:lets_study_flutter/main.dart';
import 'package:lets_study_flutter/presentation/screens/education_card_widget.dart';
import 'package:lets_study_flutter/presentation/screens/progress_widget.dart';
import 'package:lets_study_flutter/presentation/screens/quiz_widget.dart';
import 'package:lets_study_flutter/logic/cubit/quiz_cubit.dart';
import 'package:lets_study_flutter/logic/cubit/activity_cubit.dart';


class MainModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => QuizCubit()),
    Bind.singleton((i) => ActivityCubit()),
  ]; // Define your bindings here if needed

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
        ChildRoute('/education-card-page', child: (context, args) => 
        EducationCardWidgetPage(cardTitle: args.data["cardTitle"],
                                cardTitleSize: args.data["cardTitleSize"],
                                cardDescription: args.data["cardDescription"],
                              )),
        ChildRoute('/progress-page', child: (context, args) => ProgressWidgetPage()),
        ChildRoute('/quiz-page', child: (context, args) => QuizWidgetPage()),
      ];
}