import 'package:flutter/material.dart';

class AddExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Exercise')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Exercise Type',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            // Workout
            buildExerciseButton(context, 'Workout', Icons.fitness_center, () {
              print('test');
            }),
            SizedBox(height: 15),

            // Running
            buildExerciseButton(context, 'Running', Icons.directions_run, () {
              print('test');
            }),
            SizedBox(height: 15),

            // Biking
            buildExerciseButton(context, 'Biking', Icons.directions_bike, () {
              print('test');
            }),
            SizedBox(height: 15),

            // Custom Exercise
            buildExerciseButton(context, 'Custom Exercise', Icons.control_point, () {
              print('test');
            }),
          ],
        ),
      ),
    );
  }

  // Helper method to build each exercise button
  Widget buildExerciseButton(
    BuildContext context,
    String title,
    IconData icon,
    Function onTap,
  ) {
    return GestureDetector(
      onTap: () => onTap(),
      // size of buttons
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // icons and text
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 20),
            Text(title, style: TextStyle(fontSize: 18, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
