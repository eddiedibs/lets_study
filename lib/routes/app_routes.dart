import 'package:flutter_modular/flutter_modular.dart';
import 'package:lets_study_flutter/main.dart';
import 'package:lets_study_flutter/widgets/education_card_widget.dart';
import 'package:lets_study_flutter/widgets/progress_widget.dart';
import 'package:lets_study_flutter/widgets/quiz_widget.dart';


class MainModule extends Module {
  @override
  List<Bind> get binds => []; // Define your bindings here if needed

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
        ChildRoute('/education-card-page', child: (context, args) => EducationCardWidgetPage()),
        ChildRoute('/progress-page', child: (context, args) => ProgressWidgetPage()),
        ChildRoute('/quiz-page', child: (context, args) => QuizWidgetPage()),
      ];
}