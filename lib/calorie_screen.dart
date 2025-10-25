import 'package:flutter/material.dart';

class CalorieScreen extends StatefulWidget {
  @override
  CalorieScreenState createState() => CalorieScreenState();
}

class CalorieScreenState extends State<CalorieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Tracker'),
      ),
    );
  }
}