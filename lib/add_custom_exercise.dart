import 'package:flutter/material.dart';

class AddCustomScreen extends StatefulWidget {
  @override
  AddCustomScreenState createState() => AddCustomScreenState();
}

class AddCustomScreenState extends State<AddCustomScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Custom Exercise'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Custom Exercise', style: TextStyle(fontSize:28, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
          ]
        )
      )
    );
  }

}