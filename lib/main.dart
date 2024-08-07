import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lets_study_flutter/presentation/router/main_module.dart';
import 'package:lets_study_flutter/design/activity_card.dart';
import 'package:lets_study_flutter/design/custom_app_bar.dart';
import 'package:lets_study_flutter/design/custom_bottom_app_bar.dart';
import 'package:lets_study_flutter/design/components/activity_card_quizzes_component.dart';

import 'package:lets_study_flutter/logic/cubit/activity_cubit.dart';
import 'package:lets_study_flutter/logic/cubit/quiz_cubit.dart';
import 'package:lets_study_flutter/logic/cubit/education_cubit.dart';
import 'package:lets_study_flutter/logic/cubit/course_cubit.dart';

void main() {
  // Inicializa la aplicación con el módulo principal de Modular y el widget raíz.
  runApp(ModularApp(module: AppModule(), child: MyActivityApp()));
}

class MyActivityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Proveedor para el cubit de actividades.
        BlocProvider<ActivityCubit>(
          create: (BuildContext context) => Modular.get<ActivityCubit>()..loadActivities(),
        ),
        // Proveedor para el cubit de quizzes.
        BlocProvider<QuizCubit>(
          create: (BuildContext context) {
            final quizCubit = Modular.get<QuizCubit>();
            quizCubit.loadQuizzes(); // Llama a loadQuizzes cuando se crea el cubit.
            return quizCubit;
          },
        ),
        // Proveedor para el cubit de educación.
        BlocProvider<EducationCubit>(
          create: (BuildContext context) => Modular.get<EducationCubit>(),
        ),
        // Proveedor para el cubit de cursos.
        BlocProvider<CourseCubit>(
          create: (BuildContext context) => Modular.get<CourseCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'My Activity',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 230, 231, 235),
        ),
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "Mi actividad", isHomePage: true),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<ActivityCubit, ActivityState>(
            builder: (context, state) {
              if (state is ActivityLoaded) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 180,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                // Carga los cursos cuando se hace clic en el progreso interactivo.
                                Modular.get<CourseCubit>().loadCourses();
                                // Envia al usuario a la ruta.
                                Modular.to.pushNamed(state.activities[0].activityCard.route ?? "/");
                              },
                              child: ActivityCard(
                                title: state.activities[0].activityCard.title,
                                titleSize: state.activities[0].activityCard.titleSize,
                                color: state.activities[0].activityCard.color,
                                widgetComponent: [
                                  ...state.activities[0].activityCard.widgetComponent ?? [Container()]
                                ],
                                iconColor: state.activities[0].activityCard.iconColor,
                                icon: state.activities[0].activityCard.icon,
                                route: state.activities[0].activityCard.route,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          width: 180,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                // Envia al usuario a la ruta.
                                Modular.to.pushNamed(state.activities[1].activityCard.route ?? "/");
                              },
                              child: ActivityCard(
                                title: state.activities[1].activityCard.title,
                                titleSize: state.activities[1].activityCard.titleSize,
                                color: state.activities[1].activityCard.color,
                                widgetComponent: [
                                  BlocBuilder<QuizCubit, QuizState>(
                                    builder: (context, state) {
                                      if (state is QuizSuccess) {
                                        return QuizzesComponent(
                                          quizzes: state.quizzes,
                                        );
                                      } else {
                                        return const Text(
                                          "No hay quizzes pendientes.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        );
                                      }
                                    }
                                  )
                                ],
                                iconColor: state.activities[1].activityCard.iconColor,
                                icon: state.activities[1].activityCard.icon,
                                route: state.activities[1].activityCard.route,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.activities.skip(2).take(1).map((activity) {
                        return SizedBox(
                          height: 320,
                          width: 180,
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                // Carga la informacion del usuario cuando se hace clic en el perfil.
                                Modular.get<EducationCubit>().loadEducation();
                                // Envia al usuario a la ruta.
                                Modular.to.pushNamed(activity.activityCard.route ?? "/");
                              },
                              child: ActivityCard(
                                title: activity.activityCard.title,
                                titleSize: activity.activityCard.titleSize,
                                color: activity.activityCard.color,
                                widgetComponent: [
                                  ...activity.activityCard.widgetComponent ?? [Container()]
                                ],
                                iconColor: activity.activityCard.iconColor,
                                icon: activity.activityCard.icon,
                                route: activity.activityCard.route,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
