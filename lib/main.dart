import 'package:dhir_app/view/screens/bottom_nav_screen.dart';
import 'package:dhir_app/controller/provider_data.dart';
import 'package:dhir_app/view/screens/bottom_nav_screen.dart';
import 'package:dhir_app/view/screens/donate_screen.dart';
import 'package:dhir_app/view/screens/get_started_screen.dart';
import 'package:dhir_app/view/screens/home_screen.dart';
import 'package:dhir_app/view/screens/login_screen.dart';
import 'package:dhir_app/view/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

final RouteObserver<PageRoute<dynamic>> routeObserver =
    RouteObserver<PageRoute<dynamic>>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth _auth = FirebaseAuth.instance;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderData()),
        // Add more providers here as needed
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [routeObserver],
        home: StreamBuilder<User?>(
          stream: _auth.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              User? user = snapshot.data;
              if (user == null) {
                return RegisterScreen();
              } else {
                return BottomNavigationScreen();
              }
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    ),
  );
}
