import 'package:flutter/material.dart';

class AddWorkoutScreen extends StatefulWidget {
  @override
  AddWorkoutScreenState createState() => AddWorkoutScreenState();
}

class AddWorkoutScreenState extends State<AddWorkoutScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Workout'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Weight Training', style: TextStyle(fontSize:28, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
          ]

        )
      )
    );
  }

}