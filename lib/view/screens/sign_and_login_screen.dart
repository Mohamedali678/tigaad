import 'package:dhir_app/view/screens/login_screen.dart';
import 'package:dhir_app/view/screens/register_screen.dart';
import 'package:flutter/material.dart';

class SignupAndLoginScreen extends StatelessWidget {
  const SignupAndLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.7),
          BlendMode.dstATop,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/home.png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                image: AssetImage("images/logo.png"),
              ),
              SizedBox(
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
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
                    "Signup",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(12),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff64994A), width: 2),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Register later",
                  style: TextStyle(
                    color: Color(0xff64994A),
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
