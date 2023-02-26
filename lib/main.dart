import 'package:dhir_app/view/screens/bottom_nav_screen.dart';
import 'package:dhir_app/view/screens/donate_screen.dart';
import 'package:dhir_app/view/screens/get_started_screen.dart';
import 'package:dhir_app/view/screens/home_screen.dart';
import 'package:dhir_app/view/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  );
}
