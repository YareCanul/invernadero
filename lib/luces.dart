import 'package:flutter/material.dart';

class LucesScreen extends StatefulWidget {
  @override
  _LucesScreenState createState() => _LucesScreenState();
}

class _LucesScreenState extends State<LucesScreen> {
  List<bool> lightSwitches = [false, false, false, false, false, false, false, false];


  Widget _buildLightItem(int index) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightSwitches[index] ? Colors.yellow : Colors.grey,
              ),
              child: Icon(
                Icons.lightbulb,
                color: Colors.white,
                size: 32.0,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Luz ${index + 1}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8),
            Switch(
              value: lightSwitches[index],
              onChanged: (value) {
                setState(() {
                  lightSwitches[index] = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Luces'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 154, 240, 161),
              Color.fromARGB(255, 169, 230, 179),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: lightSwitches.length,
            itemBuilder: (context, index) {
              return _buildLightItem(index);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            lightSwitches.add(false);
          });
        },
      ),
    );
  }
}
