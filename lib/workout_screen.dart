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
        actions: [
          // INFO BUTTON
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              print('go to preset routines');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('add new workout');
        },
        child: Icon(Icons.add),
      )
    );
  }
}