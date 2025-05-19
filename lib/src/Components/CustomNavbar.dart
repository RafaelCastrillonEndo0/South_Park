// ignore: file_names
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home, size: 31,) , label: '')
      ],
      selectedItemColor: customOrange,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 10,
    );
  }
}