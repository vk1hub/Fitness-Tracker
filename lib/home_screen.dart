import 'package:flutter/material.dart';
import 'calorie_screen.dart';
import 'chart_screen.dart';
import 'workout_screen.dart';
import 'workout_model.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // keeping track current page index
  int currentPage = 0;

  // List to store all workouts
  List<WorkoutModel> workouts = [];

  // Function to add a workout
  void addWorkout(WorkoutModel workout) {
    setState(() {
      workouts.add(workout);
    });
  }

  @override
  Widget build(BuildContext context) {
    // list of screens - pass workouts and addWorkout function to WorkoutScreen
    final List<Widget> screens = [
      WorkoutScreen(workouts: workouts, onAddWorkout: addWorkout),
      CalorieScreen(),
      ChartScreen(),
    ];

    return Scaffold(
      body: screens[currentPage],

      // Bottom navigation bar for switching between screens
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        // Bottom navigation tabs
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'Calories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}