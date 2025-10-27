import 'package:flutter/material.dart';
import 'workout_model.dart';

class ChartScreen extends StatefulWidget {
  final List<WorkoutModel> workouts;

  ChartScreen({this.workouts = const []});

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

  // Calculate total workout time for a specific day
  double workoutTimePerDay(DateTime day) {
    double totalTime = 0;
    
    for (var workout in widget.workouts) {
      if (workout.date.year == day.year &&
          workout.date.month == day.month &&
          workout.date.day == day.day) {
        
        // get time from workout details
        String details = workout.details;
        if (details.contains('Time:')) {
          String timePart = details.split('Time:')[1].split('\n')[0].trim();
          String timeValue = timePart.split(' ')[0];
          double time = double.tryParse(timeValue) ?? 0;
          totalTime += time;
        }
        
        // get total time from weight training details
        if (details.contains('Total Time:')) {
          String timePart = details.split('Total Time:')[1].trim();
          String timeValue = timePart.split(' ')[0];
          double time = double.tryParse(timeValue) ?? 0;
          totalTime += time;
        }
      }
    }
    
    return totalTime;
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
    List<String> dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    
    // track days that goal was met
    int daysMetGoal = 0;
    for (var day in weekDays) {
      if (workoutTimePerDay(day) >= 45) {
        daysMetGoal++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Chart'),
      ),
      body: Column(
        children: [
          // Week calendar
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
                    'Days completed: $daysMetGoal/7',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          
          // Chart area
          Expanded( 
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        // Dashed line at 45 minutes
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: (45 / 90) * 400 + 53,
                          child: CustomPaint(
                            size: Size(double.infinity, 1),
                            painter: DashedLinePainter(),
                          ),
                        ),
                        
                        // Bars
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.generate(7, (index) {
                            double time = workoutTimePerDay(weekDays[index]);
                            
                            // get the max height of the bar (max 90 minutes shown)
                            double maxHeight = 400;
                            double barHeight = (time / 90) * maxHeight;
                            if (barHeight > maxHeight) barHeight = maxHeight;
                            
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // add time label for the bar
                                if (time > 0)
                                  Text(
                                    '${time.toInt()}',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                if (time > 0) SizedBox(height: 4),
                                
                                // the bar
                                Container(
                                  width: 30,
                                  height: barHeight,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                
                                // Day name
                                Text(
                                  dayNames[index],
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '${weekDays[index].month}/${weekDays[index].day}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  
                  // Goal line 
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPaint(
                        size: Size(20, 3),
                        painter: DashedLinePainter(),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '45 min goal',
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    ],
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

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;

    double dashWidth = 5;
    double dashSpace = 5;
    double x = 0;

    while (x < size.width) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + dashWidth, 0),
        paint,
      );
      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}