import 'package:flutter/material.dart';

class AddRunningBikingScreen extends StatefulWidget {

  // Constructor to accept type parameter (running or biking)
  final String type;
  AddRunningBikingScreen({required this.type});

  @override
  AddRunningBikingState createState() => AddRunningBikingState();
}

class AddRunningBikingState extends State<AddRunningBikingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log ${widget.type}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.type, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}