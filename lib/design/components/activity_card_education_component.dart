import 'package:flutter/material.dart';

class EducationComponent extends StatefulWidget {
  final String cardTitle;
  final double cardTitleSize;
  final String cardDescription;
  final String imgUrl;

  EducationComponent({
    required this.cardTitle,
    required this.cardTitleSize,
    required this.cardDescription,
    required this.imgUrl,
  });

  @override
  EducationComponentState createState() => EducationComponentState();
}
class EducationComponentState extends State<EducationComponent> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(widget.imgUrl),
                    ),
                SizedBox(height: 10),
                Text(
                  widget.cardTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: widget.cardTitleSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.cardDescription,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
                
  }


}