import 'package:flutter/material.dart';

class CoursesComponent extends StatefulWidget {
  final List<String> coursesNames;
  final List<double> progress;
  final Color textColor;
  final Color progressColor;
  final Color progressBgColor;

  CoursesComponent({
    required this.coursesNames,
    required this.progress,
    required this.textColor,
    required this.progressColor,
    required this.progressBgColor,
  });

  @override
  CoursesComponentState createState() => CoursesComponentState();
}
class CoursesComponentState extends State<CoursesComponent> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double stateProgress = 0; // Target progress value

  @override
  void initState() {
    super.initState();
    // stateProgress = widget.progress;
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
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
            SizedBox(
              height: 100,
              width: 100,
              child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                child: CircularProgressIndicator(
                  strokeWidth: 6.0,
                  value: _animation.value,
                  color: widget.progressColor,
                  backgroundColor: widget.progressBgColor,
                ), 

                );
              }),
            ),
            AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                child: Text('${(_animation.value * 100).toStringAsFixed(2)}%',
                  style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: widget.textColor == Colors.white ? Colors.black : Colors.white,
                    ),
                  ), 
              );
            })
          ],
        );
                
  }


}