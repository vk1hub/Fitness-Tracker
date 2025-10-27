import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  @override
  ChartScreenState createState() => ChartScreenState();
}

class ChartScreenState extends State<ChartScreen> {
  DateTime currentWeekStart = DateTime.now();

  @override
  void initState() {
    super.initState();
    currentWeekStart = getStartOfWeek(DateTime.now());
  }

  // Get the start of the week (Sunday)
  DateTime getStartOfWeek(DateTime date) {
    int weekday = date.weekday;
    if (weekday == 7) {
      return DateTime(date.year, date.month, date.day);
    }
    return date.subtract(Duration(days: weekday));
  }

  List<DateTime> getWeekDays() {
    List<DateTime> days = [];
    for (int i = 0; i < 7; i++) {
      days.add(currentWeekStart.add(Duration(days: i)));
    }
    return days;
  }

  void previousWeek() {
    setState(() {
      currentWeekStart = currentWeekStart.subtract(Duration(days: 7));
    });
  }

  void nextWeek() {
    setState(() {
      currentWeekStart = currentWeekStart.add(Duration(days: 7));
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> weekDays = getWeekDays();

    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Chart'),
      ),
      body: Column(
        children: [
          // Week calender
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: previousWeek,
                ),
                Text(
                  '${weekDays.first.month}/${weekDays.first.day} - ${weekDays.last.month}/${weekDays.last.day}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: nextWeek,
                ),
              ],
            ),
          ),
          
          // Goal UI
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Weekly Goal: 45 min/day',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Days completed: 0/7',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}