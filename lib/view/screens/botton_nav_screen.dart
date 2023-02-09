import 'package:dhir_app/view/screens/donate_screen.dart';
import 'package:dhir_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  //const BottomNavigationScreen({super.key});
  final List<Widget> screens = [
    HomeScreen(),
    DonateScreen(),
    Text("Screen Three"),
    Text("Screen Four"),
  ];

  int indexScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomNavigationBar(
        selectedItemColor: Colors.green,
        showSelectedLabels: true,
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
