import 'package:flutter/material.dart';
import 'package:recipe/consr.dart';

final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              key.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              key.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.fireplace_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  elevation: 0,
                  duration: Duration(seconds: 1),
                  backgroundColor: Colors.black,
                  content: Container(
                  
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Saved",
                      textAlign: TextAlign.center,
                      style: kdefaultStyle,
                    ),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              key.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
