import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhir_app/controller/Firebase/auth.dart';
import 'package:dhir_app/view/screens/forget_password_screen.dart';
import 'package:dhir_app/view/screens/home_screen.dart';
import 'package:dhir_app/view/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:developer';
import '../../shared/constants.dart';
import '../../shared/context.dart';
import 'bottom_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  // String smsCode = '';
  // String verificationId = "";
  // var _instance = FirebaseFirestore.instance;
  // bool isFound = false;
  // final snackBar3 = SnackBar(content: Text("Marka hore is diwaan gali."));

  // void sendSMS(String phonenumber) async {
  //   // Future<bool> userExists(String username) async =>
  //   //     (await _instance.collection("users").where("username", isEqualTo: username).getDocuments()).documents.length > 0;

  //   Future<bool> userExists(String phoneNumber) async => (await _instance
  //       .collection("Users")
  //       .where("phoneNumber", isEqualTo: _email.text)
  //       .get()
  //       .then((value) => value.size > 0 ? true : false));

  //   if (!(await userExists(_email.text))) {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phonenumber,
  //       verificationCompleted: (PhoneAuthCredential credential) {},
  //       verificationFailed: (FirebaseAuthException e) {
  //         if (e.code == 'invalid-phone-number') {
  //           const snackBar1 = SnackBar(content: Text("Number-ka waa khalad."));

  //           ScaffoldMessenger.of(context).showSnackBar(snackBar1);
  //         }
  //       },
  //       codeSent: (String verificationId, int? resendToken) async {
  //         final smsCode = await getSmsCodeFromUser(context);

  //         if (smsCode != null) {
  //           // Create a PhoneAuthCredential with the code
  //           final credential = PhoneAuthProvider.credential(
  //             verificationId: verificationId,
  //             smsCode: smsCode,
  //           );

  //           // Sign the user in (or link) with the credential
  //           final result =
  //               await FirebaseAuth.instance.signInWithCredential(credential);

  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => BottomNavigationScreen()));
  //         }
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //     );
  //   } else {
  //     print("numberka wuu jiraa");
  //   }
  // }

  // Check sms fucntion: TODO

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    AppContext.context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),

              Image(
                image: AssetImage("assets/images/logo.png"),
              ),

              SizedBox(
                height: 30,
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Emailk-aaga Meeshaan buuxi';
                          }
                          return null;
                        },
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
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
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // small boxes
              Padding(
                padding: EdgeInsets.all(12.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password-kaaga Meeshaan buuxi';
                    }
                    return null;
                  },
                  controller: _password,
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
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      try {
                        Auth().logIn(_email.text, _password.text);
                      } on FirebaseAuthException catch (e) {
                        // handle FirebaseAuthException
                        if (e.code == 'user-not-found') {
                          // user not found
                        } else if (e.code == 'wrong-password') {
                          // wrong password
                        } else {
                          // other FirebaseAuthException
                        }
                      } on PlatformException catch (e) {
                        // handle PlatformException
                      } catch (e) {
                        // handle other exceptions
                      }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationScreen(),
                        ),
                      );
                    }
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                    color: Color(0xff64994A),
                    fontSize: 16,
                  ),
                ),
              ),

              // 2
            ],
          ),
        ),
      ),
    );
  }
}

Future<String?> getSmsCodeFromUser(BuildContext context) async {
  String? smsCode;

  // Update the UI - wait for the user to enter the SMS code
  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text('SMS code:'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Sign in'),
          ),
          OutlinedButton(
            onPressed: () {
              smsCode = null;
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
        content: Container(
          padding: const EdgeInsets.all(20),
          child: TextField(
            style: TextStyle(fontSize: 30),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              smsCode = value;
            },
            textAlign: TextAlign.center,
            autofocus: true,
          ),
        ),
      );
    },
  );

  return smsCode;
}
