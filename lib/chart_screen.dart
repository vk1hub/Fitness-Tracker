import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  @override
  ChartScreenState createState() => ChartScreenState();
}

class ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Chart'),
      ),
    );
  }
}