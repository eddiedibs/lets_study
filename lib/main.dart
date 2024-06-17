import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lets_study_flutter/routes/main_module.dart';
import 'package:lets_study_flutter/design/activity_card.dart';
import 'package:lets_study_flutter/design/custom_app_bar.dart';
import 'package:lets_study_flutter/design/custom_bottom_app_bar.dart';
import 'package:lets_study_flutter/design/components/activity_card_circle_progress_component.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child:MyActivityApp()));
  // runApp(MyActivityApp());  
  
  }

class MyActivityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Activity',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 230, 231, 235),
      ),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: "My Activity", isHomePage: true),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        height: double.infinity, // Ensure the container takes full height
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: 180,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Modular.to.pushNamed('/progress-page');
                      },
                      child: ActivityCard(
                          title: 'Progreso',
                          color: const Color.fromARGB(255, 38, 46, 92),
                          widgetComponent: [CircleProgressComponent(
                                progress: 0.7,
                                textColor: const Color.fromARGB(255, 38, 46, 92),
                                progressColor: const Color.fromARGB(255, 248, 34, 156),
                                progressBgColor: const Color.fromARGB(255, 60, 69, 110),
                              )],
                          iconColor: const Color.fromARGB(255, 248, 34, 156),
                          icon: Icons.local_fire_department,
                        ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 280,
                //   child: Center(
                //     child: InkWell(
                //       onTap: () {
                //         Modular.to.pushNamed('/progress-page');
                //       },
                //       child: ActivityCard(
                //         title: 'Cursos',
                //         color: Color.fromARGB(255, 255, 255, 255),
                //         iconColor: const Color.fromARGB(255, 238, 116, 113),
                //         icon: Icons.interests,
                //         widgetComponent: ,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}


