import 'package:dhir_app/controller/provider_data.dart';
import 'package:dhir_app/view/screens/botton_nav_screen.dart';
import 'package:dhir_app/view/screens/donate_screen.dart';
import 'package:dhir_app/view/screens/get_started_screen.dart';
import 'package:dhir_app/view/screens/home_screen.dart';
import 'package:dhir_app/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => ProviderData()),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        home: BottomNavigationScreen(),
      ),
    ),
  );
}
