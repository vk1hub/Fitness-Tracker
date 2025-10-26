import 'package:flutter/material.dart';

class AddWorkoutScreen extends StatefulWidget {
  @override
  AddWorkoutScreenState createState() => AddWorkoutScreenState();
}

class AddWorkoutScreenState extends State<AddWorkoutScreen> {
  // Controllers for text input fields
  TextEditingController exerciseNameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController repsController = TextEditingController();
  TextEditingController timeController = TextEditingController();

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
            Text(
              'Weight Training',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            
            // Exercise Name field
            TextField(
              controller: exerciseNameController,
              decoration: InputDecoration(
                labelText: 'Exercise Name (e.g., Bicep Curl)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            
            // Weight and Reps fields
            Row(
              children: [
                // Weight field
                Expanded(
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight (lbs)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Reps field
                Expanded(
                  child: TextField(
                    controller: repsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Reps',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            
            // Add Set button
            GestureDetector(
              onTap: () {
                //
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    'Add Set',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
            
            Spacer(),
            
            // Time field 
            TextField(
              controller: timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Total Time (minutes)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            
            // Action buttons
            Row(
              children: [
                // Discard button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          'Discard',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Add Workout button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      //
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          'Add Workout',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}