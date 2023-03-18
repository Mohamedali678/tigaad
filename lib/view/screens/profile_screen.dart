import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../controller/provider_data.dart';
import '../../shared/context.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Name: Ali Faarah",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Taleefan: 061321323",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
