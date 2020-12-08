import 'package:flutter/material.dart';
import '../src/pages/picturePage.dart';
import '../src/pages/searchPage.dart';
import '../src/pages/foundPage.dart';

class BottomNavBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) {
                return SearchScreen();
              }));
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) {
                return PictureScreen();
              }));
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) {
                return FoundScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}