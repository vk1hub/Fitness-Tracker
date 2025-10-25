import 'package:flutter/material.dart';
import 'preset_routines.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PresetRoutinesScreen()),
              );
            },
          ),
        ],
      ),
      // ADD WORKOT BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('add new workout');
        },
        child: Icon(Icons.add),
      )
    );
  }
}