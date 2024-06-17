import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lets_study_flutter/routes/main_module.dart';
import 'package:lets_study_flutter/design/activity_card.dart';
import 'package:lets_study_flutter/design/custom_app_bar.dart';
import 'package:lets_study_flutter/design/custom_bottom_app_bar.dart';

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
                          value: 'Progreso',
                          color: const Color.fromARGB(255, 38, 46, 92),
                          progress: 0.7,
                          progressColor: const Color.fromARGB(255, 248, 34, 156),
                          progressBgColor: const Color.fromARGB(255, 60, 69, 110),
                          icon: Icons.local_fire_department,
                        ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 280,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Modular.to.pushNamed('/progress-page');
                      },
                      child: ActivityCard(
                        value: 'Cursos',
                        color: Color.fromARGB(255, 255, 255, 255),
                        progress: 0.7,
                        progressColor: const Color.fromARGB(255, 238, 116, 113),
                        progressBgColor: const Color.fromARGB(255, 240, 241, 245),
                        icon: Icons.interests,
                      ),
                    ),
                  ),
                ),
                // Add more ActivityCards as needed
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}


