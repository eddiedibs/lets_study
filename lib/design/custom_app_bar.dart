import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;

  CustomAppBar({
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.transparent,
      height: 100.0, 
      padding: const EdgeInsets.symmetric(horizontal: 8.0), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, 
        children: [
          Text(titleText,
                style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 21,
                fontWeight: FontWeight.bold,
                      )),
          IconButton(
            icon: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 241, 245),
                  borderRadius: BorderRadius.circular(10), // Adjust the value to change the roundness
                ),
              child: const Icon(Icons.grid_view),
              ), 
            onPressed: () {
              // Handle the button press here
              print('Burger button pressed');
            },
          ),
        ],
      ),
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
