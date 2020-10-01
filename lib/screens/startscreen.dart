import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson2creative/screens/carddemo_screen.dart';
import 'package:lesson2creative/screens/gridviewdemo_screen.dart';

class StartScreen extends StatelessWidget {
  static const routeName = '/startScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RaisedButton.icon(
            onPressed: () => Navigator.pushNamed(context, CardDemoScreen.routeName),
            color: Colors.red[900],
            icon: Icon(Icons.card_membership, color: Colors.white,),
            label: Text('Card demo'),
          ),
          RaisedButton.icon(
            onPressed: () => Navigator.pushNamed(context, GridViewDemoScreen.routeName),
            color: Colors.red[900],
            icon: Icon(Icons.map, color: Colors.white,),
            label: Text('Grid View demo'),
          ),
        ],
      ),
    );
  }
}
