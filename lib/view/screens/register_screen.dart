import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhir_app/controller/Firebase/auth.dart';
import 'package:dhir_app/view/screens/bottom_nav_screen.dart';
import 'package:dhir_app/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              // Image(
              //   image: AssetImage("assets/images/tree.jpg"),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Magacaaga soo buuxi';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  controller: nameController,
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
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email-ka Meeshaan ku buuxi';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
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
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password-kaaga Meeshaan ku buuxi';
                    }
                    return null;
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
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
              // Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: TextField(
              //     controller: passwordController,
              //     decoration: InputDecoration(
              //         prefixIcon: Icon(
              //           Icons.lock,
              //           size: 40,
              //         ),
              //         hintText: "Password",
              //         fillColor: Color(0xffDFDCDD),
              //         filled: true,
              //         border: OutlineInputBorder(
              //             borderSide: BorderSide.none,
              //             borderRadius: BorderRadius.circular(8))),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: MaterialButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      Auth().registerUser(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationScreen(),
                        ),
                      );
                    }

                    // aaa
                    // auth
                    //     .createUserWithEmailAndPassword(
                    //         email: emailController.text, password: "sdAsdD@rO!32")
                    //     .then((value) {
                    //   FirebaseFirestore.instance
                    //       .collection('Users')
                    //       .doc(value.user?.uid)
                    //       .set({
                    //     "name": nameController.text,
                    //     "email": emailController.text,
                    //     "phoneNumber": phoneNumberController.text,
                    //   });
                    //   const snackBar =
                    //       SnackBar(content: Text("Waa lagu diwaan galiyay."));

                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => LoginScreen()));
                    // });
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xff64994A),
                    fontSize: 16,
                  ),
                ),
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: Text(
              //     "Forget Password",
              //     style: TextStyle(
              //       color: Color(0xff64994A),
              //       fontSize: 16,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
