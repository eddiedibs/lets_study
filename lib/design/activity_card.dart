import 'package:flutter/material.dart';

class ActivityCard extends StatefulWidget {
  final String value;
  final Color? color;
  final double progress;
  final Color progressColor;
  final Color? progressBgColor;
  final IconData icon;

  ActivityCard({
    required this.value,
    required this.progress,
    required this.progressColor,
    required this.icon,
    this.progressBgColor,
    this.color,
  });

  @override
  _ActivityCardState createState() => _ActivityCardState();
}
class _ActivityCardState extends State<ActivityCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double stateProgress = 0; // Target progress value

  @override
  void initState() {
    super.initState();
    stateProgress = widget.progress;
    _controller = AnimationController(
      duration: Duration(seconds: 3), // Duration of the animation
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: stateProgress).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  color: widget.progressColor,
                ),
                Text(
                  widget.value,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 24,
                    color: widget.color == Colors.white ? Colors.black : Colors.white,
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
                  // height: 80.0, // Desired height
                  // width: 80.0, // Desired width
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        SizedBox(
                          height: 100.0,
                          width: 100.0,
                          child: ActivityCardAnimation(
                            progress: widget.progress,
                            progressColor: widget.progressColor,
                            progressBgColor: widget.progressBgColor,
                            widgetType: ActivityWidget.circleIndicator,
                          )
                        ),
                        ActivityCardAnimation(
                          progress: widget.progress,
                          progressColor: widget.progressColor,
                          progressBgColor: widget.progressBgColor,
                          color: widget.color,
                          widgetType: ActivityWidget.text,
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




enum ActivityWidget { circleIndicator, text }
class ActivityCardAnimation extends StatefulWidget{
  final double progress;
  final Color progressColor;
  final Color? progressBgColor;
  final Color? color;
  final ActivityWidget widgetType;

  ActivityCardAnimation({
    required this.progress,
    required this.progressColor,
    required this.widgetType,
    this.progressBgColor,
    this.color,
  });
  @override
  _ActivityCardAnimationState createState() => _ActivityCardAnimationState();

}
class _ActivityCardAnimationState extends State<ActivityCardAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double stateProgress = 0; // Target progress value

  @override
  void initState() {
    super.initState();
    stateProgress = widget.progress;
    _controller = AnimationController(
      duration: Duration(seconds: 3), // Duration of the animation
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: stateProgress).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                child: getItemWidget(widget.widgetType), // Function to return the appropriate label
              );
            },
          );
    }

  Widget getItemWidget(ActivityWidget item) {
    switch (item) {
      case ActivityWidget.circleIndicator:
        return CircularProgressIndicator(
                  strokeWidth: 6.0,
                  value: _animation.value,
                  color: widget.progressColor,
                  backgroundColor: widget.progressBgColor,
                );
      case ActivityWidget.text:
        return Text('${(_animation.value * 100).toStringAsFixed(2)}%',
                  style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: widget.color == Colors.white ? Colors.black : Colors.white,
                ),
              );
      default:
        return Container();
    }
  }


}
