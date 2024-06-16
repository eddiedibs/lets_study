import 'package:flutter/material.dart';

class EducationCardWidgetPage extends StatelessWidget {
  static const routeName = '/education-card-page';

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
                  'Título de la Tarjeta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Descripción de la tarjeta educativa. Aquí puedes poner cualquier tipo de información relevante.',
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
