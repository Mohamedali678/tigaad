import 'package:dhir_app/view/screens/botton_nav_screen.dart';
import 'package:dhir_app/view/screens/donate_screen.dart';
import 'package:dhir_app/view/screens/get_started_screen.dart';
import 'package:dhir_app/view/screens/home_screen.dart';
import 'package:dhir_app/view/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationScreen(),
    ),
  );
}
