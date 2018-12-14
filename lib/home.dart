import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
      image: new AssetImage('images/DOps_Icon.PNG'),
      fit: BoxFit.none,
    )));
  }
}
