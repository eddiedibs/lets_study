import 'package:flutter/material.dart';

class ActivityCard extends StatefulWidget {
  final String title;
  final double titleSize;
  final List<Widget>? widgetComponent;
  final IconData icon;
  final Color? color;
  final Color iconColor;
  final String? route;


  ActivityCard({
    required this.title,
    required this.titleSize,
    required this.icon,
    this.widgetComponent,
    required this.iconColor,
    this.color,
    this.route,

  });

  @override
  _ActivityCardState createState() => _ActivityCardState();
}
class _ActivityCardState extends State<ActivityCard> with SingleTickerProviderStateMixin {
  late double stateProgress = 0; // Target progress value
  late Color progressColor = Colors.black;

  @override
  void initState() {
    super.initState();
    progressColor = widget.iconColor;

  }


  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 10.0, // Adjust the elevation to control the shadow size and intensity
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      color: widget.color,
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
                  widget.icon,
                  color: widget.iconColor,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: widget.titleSize,
                    color: widget.color == Colors.white ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  ...widget.widgetComponent?? [Container()],
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



