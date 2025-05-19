import 'package:flutter/material.dart';
import 'src/Pages/HomePage.dart';

void main(){
  runApp(SouthParkApp());
}

class SouthParkApp extends StatelessWidget {
  const SouthParkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}