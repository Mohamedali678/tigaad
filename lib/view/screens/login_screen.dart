import 'package:dhir_app/view/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Image(
              image: AssetImage("images/logo.png"),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      size: 40,
                    ),
                    hintText: "Email",
                    fillColor: Color(0xffDFDCDD),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 40,
                    ),
                    hintText: "Password",
                    fillColor: Color(0xffDFDCDD),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8))),
              ),
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
                  "Login",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Register",
                style: TextStyle(
                  color: Color(0xff64994A),
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forget Password",
                style: TextStyle(
                  color: Color(0xff64994A),
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
