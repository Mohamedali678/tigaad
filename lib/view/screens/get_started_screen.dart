import 'package:dhir_app/view/screens/sign_and_login_screen.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 465,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(46),
                    bottomLeft: Radius.circular(46),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/home.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Beer Hal Geed",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                " Ka Qayb Qaado Dhireynta Magaalada\n Oo Nala Beer Dhir Si\n Aan U Badbaadino Deegaankeena ",
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupAndLoginScreen(),
                      ),
                    );
                  },
                  height: 60,
                  minWidth: double.infinity,
                  color: Color(0xff64994A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
