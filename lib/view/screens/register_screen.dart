import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      Icons.person,
                      size: 40,
                    ),
                    hintText: "Name",
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
                      Icons.flag,
                      color: Colors.blue,
                      size: 40,
                    ),
                    hintText: "+252",
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
                  "Register",
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
                "Login",
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
