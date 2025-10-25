import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  WorkoutScreenState createState() => WorkoutScreenState();
}

class WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Log'),
      ),
    );
  }
}