import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lets_study_flutter/routes/main_module.dart';
import 'package:lets_study_flutter/design/activity_card.dart';
import 'package:lets_study_flutter/design/custom_app_bar.dart';
import 'package:lets_study_flutter/design/custom_bottom_app_bar.dart';
import 'package:lets_study_flutter/design/components/activity_card_progress_component.dart';
import 'package:lets_study_flutter/design/components/activity_card_education_component.dart';

import 'package:lets_study_flutter/providers/activity_cubits.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyActivityApp()));
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
    return BlocProvider(
      create: (context) => ActivityCubit()..loadActivities(),
      child: Scaffold(
        appBar: CustomAppBar(titleText: "My Activity", isHomePage: true),
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
                        children: state.activities.take(2).map((activity) {
                          return SizedBox(
                            height: 200,
                            width: 180,
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Modular.to.pushNamed('/progress-page');
                                },
                                child: ActivityCard(
                                  title: activity.activityCard.title,
                                  titleSize: activity.activityCard.titleSize,
                                  color: activity.activityCard.color,
                                  widgetComponent: [
                                    ...activity.activityCard.widgetComponent
                                  ],
                                  iconColor: activity.activityCard.iconColor,
                                  icon: activity.activityCard.icon,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
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
                                  Modular.to.pushNamed('/progress-page');
                                },
                                child: ActivityCard(
                                  title: activity.activityCard.title,
                                  titleSize: activity.activityCard.titleSize,
                                  color: activity.activityCard.color,
                                  widgetComponent: [
                                    ...activity.activityCard.widgetComponent
                                  ],
                                  iconColor: activity.activityCard.iconColor,
                                  icon: activity.activityCard.icon,
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
      ),
    );
  }
}
