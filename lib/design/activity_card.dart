import 'package:flutter/material.dart';

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
      elevation: 10.0, // Adjust the elevation to control the shadow size and intensity
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
