import 'package:flutter/material.dart';

enum ProgressComponentType { circle, linear }
class ProgressComponent extends StatefulWidget {
  final ProgressComponentType progressComponentType;
  final bool addProgressPercentage;
  final double progress;
  final Color progressColor;
  final Color progressBgColor;

  ProgressComponent({
    required this.progressComponentType,
    required this.addProgressPercentage,
    required this.progress,
    required this.progressColor,
    required this.progressBgColor,
  });

  @override
  ProgressComponentState createState() => ProgressComponentState();
}
class ProgressComponentState extends State<ProgressComponent> with SingleTickerProviderStateMixin {
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
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
              if (widget.progressComponentType == ProgressComponentType.circle)
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
              if (widget.progressComponentType == ProgressComponentType.linear)
                SizedBox(
                  height: 10,
                  width: 100,
                  child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                    return Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0), 
                          child: LinearProgressIndicator(
                          value: _animation.value,
                          color: widget.progressColor,
                          backgroundColor: widget.progressBgColor,
                          ), 
                        )
                      );
                  }),
                ),
            if (widget.addProgressPercentage)
            AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                child: Text('${(_animation.value * 100).toStringAsFixed(2)}%',
                  style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: widget.progressBgColor == Colors.white ? Colors.black : Colors.white,
                    ),
                  ), 
              );
            })
          ],
        );
                
  }


}