import 'package:dhir_app/view/screens/donate_screen.dart';
import 'package:dhir_app/view/screens/form_screen.dart';
import 'package:dhir_app/view/screens/home_screen.dart';
import 'package:dhir_app/view/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({
    super.key,
  });

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final List<Widget> screens = [
    HomeScreen(),
    DonateScreen(),
    FormScreen(),
    ProfileScreen(),
  ];

  int indexScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomNavigationBar(
        currentIndex: indexScreen,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            indexScreen = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Donate",
            icon: Icon(
              Icons.clean_hands,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Support",
            icon: Icon(
              Icons.message_sharp,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ],
      ),
      body: screens[indexScreen],
    );
  }
}
