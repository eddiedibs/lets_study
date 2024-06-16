import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  // final String titleText;

  // CustomBottomAppBar({
  //   required this.titleText,
  // });

  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                        color: const Color.fromARGB(255, 240, 241, 245),
                        borderRadius: BorderRadius.circular(50), // Adjust the value to change the roundness
                      ),
                ), 
                SizedBox(
                  width: 100.0, // Adjust the size as needed
                  height: 100.0, // Adjust the size as needed
                  child: IconButton(
                    icon: Icon(Icons.school),
                    onPressed: () {
                      // route placeholder 
                    },
                  ), 
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(50), // Adjust the value to change the roundness
                      ),
                ), 
                SizedBox(
                  width: 100.0, // Adjust the size as needed
                  height: 100.0, // Adjust the size as needed
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // route placeholder 
                    },
                  ), 
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        color: const Color.fromARGB(255, 240, 241, 245),
                        borderRadius: BorderRadius.circular(50), // Adjust the value to change the roundness
                      ),
                ), 
                SizedBox(
                  width: 100.0, // Adjust the size as needed
                  height: 100.0, // Adjust the size as needed
                  child: IconButton(
                    icon: Icon(Icons.book),
                    onPressed: () {
                      // route placeholder 
                    },
                  ), 
                ),
              ],
            ),
          ],
      );
  }


}
