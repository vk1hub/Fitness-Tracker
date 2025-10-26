import 'package:flutter/material.dart';

class AddCustomScreen extends StatefulWidget {
  @override
  AddCustomScreenState createState() => AddCustomScreenState();
}

class AddCustomScreenState extends State<AddCustomScreen> {

  // manage input fields
  TextEditingController customController = TextEditingController();
  TextEditingController timeController = TextEditingController();

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
            Text('Custom Exercise', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            
            // exercise description input with a max of 3 lines
            TextField(
              controller: customController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Describe your workout',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            
            // time input
            TextField(
              controller: timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Time (minutes)',
                border: OutlineInputBorder(),
              ),
            ),
            
            Spacer(),
            
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
                // add exercise
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
                          'Add Exercise',
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