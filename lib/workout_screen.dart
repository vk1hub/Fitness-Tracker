import 'package:flutter/material.dart';
import 'preset_routines.dart';
import 'add_exercise_screen.dart';
import 'workout_model.dart';

class WorkoutScreen extends StatefulWidget {
  final List<WorkoutModel> workouts;
  final Function(WorkoutModel) onAddWorkout;

  WorkoutScreen({required this.workouts, required this.onAddWorkout});

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
      body: widget.workouts.isEmpty
          ? Center(
              child: Text(
                'No workouts yet!\nTap + to add your first workout',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: widget.workouts.length,
              itemBuilder: (context, index) {
                final workout = widget.workouts[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            workout.type,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${workout.date.month}/${workout.date.day}/${workout.date.year}',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        workout.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(workout.details),
                    ],
                  ),
                );
              },
            ),
      // ADD WORKOUT BUTTON - pass callback
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddExerciseScreen(onAddWorkout: widget.onAddWorkout),
            ),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}