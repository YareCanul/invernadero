import 'package:flutter/material.dart';
import 'package:invernadero/SplashScreen.dart';



void main() {
  runApp(ControlHogarApp());
}

class ControlHogarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invernadero',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: Colors.green,
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home:SplashScreen(),
      
    );
  }
}
