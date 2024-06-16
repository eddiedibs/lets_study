import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lets_study_flutter/routes/main_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child:MyActivityApp()));
  // runApp(MyActivityApp());  
  
  }

class MyActivityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Activity',
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('My Activity',
                            style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18,
                      )),
        leading: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(15.0),
              bottomRight: const Radius.circular(15.0),
            ),
        child: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: <Widget>[
            Center(
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
            ActivityCard(
              value: '85 Score',
              color: Colors.white,
              progress: 0.5,
              progressColor: Colors.yellow,
              progressBgColor: Colors.grey[300],
              icon: Icons.bedtime,
            ),
            ActivityCard(
              value: '2,227 Steps',
              color: Colors.white,
              progress: 0.4,
              progressColor: Colors.red,
              progressBgColor: Colors.grey[300],
              icon: Icons.directions_walk,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String value;
  final Color? color;
  final double progress;
  final Color progressColor;
  final Color? progressBgColor;
  final IconData icon;

  ActivityCard({
    required this.value,
    this.color,
    required this.progress,
    required this.progressColor,
    this.progressBgColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    final progressBarText = '${(progress * 100).toStringAsFixed(2)}%';
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: progressColor,
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 24,
                    color: color == Colors.white ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Spacer(),
            Center( // This centers the Column widget within the Scaffold
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Container(
                  height: 80.0, // Desired height
                  width: 80.0, // Desired width
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        SizedBox(
                          width: 100.0, // Adjust the size as needed
                          height: 100.0, // Adjust the size as needed
                          child: CircularProgressIndicator(
                            strokeWidth: 6.0,
                            value: progress,
                            color: progressColor,
                            backgroundColor: progressBgColor,
                          ),  
                        ),
                        Text(progressBarText,
                          style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: color == Colors.white ? Colors.black : Colors.white,
                        ),
                      ),
                      ],
                    )

                  )
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
