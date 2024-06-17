import 'package:flutter/material.dart';

class ActivityCard extends StatefulWidget {
  final String value;
  final Color? color;
  final double progress;
  final Color progressColor;
  final Color? progressBgColor;
  final IconData icon;
    // Constructor for MyCustomWidget
  ActivityCard({
    required this.value,
    this.color,
    required this.progress,
    required this.progressColor,
    this.progressBgColor,
    required this.icon,
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
                  height: 80.0, // Desired height
                  width: 80.0, // Desired width
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 6.0,
                                value: _animation.value,
                                color: widget.progressColor,
                                backgroundColor: widget.progressBgColor,
                              ),
                            );
                          },
                        ),
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Text('${(_animation.value * 100).toStringAsFixed(2)}%',
                                style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: widget.color == Colors.white ? Colors.black : Colors.white,
                              ),
                            );
                          },
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
