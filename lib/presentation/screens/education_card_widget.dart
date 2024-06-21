import 'package:flutter/material.dart';

class EducationCardWidgetPage extends StatelessWidget {
  final String cardTitle;
  final double cardTitleSize;
  final String cardDescription;

  EducationCardWidgetPage({
    required this.cardTitle,
    required this.cardTitleSize,
    required this.cardDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjeta Educativa'),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network('https://via.placeholder.com/150'),
                SizedBox(height: 10),
                Text(
                  cardTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: cardTitleSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  cardDescription,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Opción 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Opción 2'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
