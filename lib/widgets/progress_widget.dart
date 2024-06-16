import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressWidgetPage extends StatefulWidget {
  static const routeName = '/progress-page';

  @override
  _ProgressWidgetPageState createState() => _ProgressWidgetPageState();
}

class _ProgressWidgetPageState extends State<ProgressWidgetPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut);
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progreso Interactivo'),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _animation!,
          child: CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 10.0,
            animation: true,
            percent: 0.7,
            center: Text(
              "70%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: Text(
              "Progreso del Curso",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
