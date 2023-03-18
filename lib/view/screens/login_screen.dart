import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhir_app/view/screens/forget_password_screen.dart';
import 'package:dhir_app/view/screens/home_screen.dart';
import 'package:dhir_app/view/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _smsCodeController = TextEditingController();
  String smsCode = '';
  String verificationId = "";
  var _instance = FirebaseFirestore.instance;
  bool isFound = false;
  final snackBar3 = SnackBar(content: Text("Marka hore is diwaan gali."));
  late final String userName;

  void sendSMS(String phonenumber) async {
    // Future<bool> userExists(String username) async =>
    //     (await _instance.collection("users").where("username", isEqualTo: username).getDocuments()).documents.length > 0;

    Future<bool> userExists(String phoneNumber) async => (await _instance
        .collection("Users")
        .where("phoneNumber", isEqualTo: _phoneNumberController.text)
        .get()
        .then((value) => value.size > 0 ? true : false));

    if (!(await userExists(_phoneNumberController.text))) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phonenumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            const snackBar1 = SnackBar(content: Text("Number-ka waa khalad."));

            ScaffoldMessenger.of(context).showSnackBar(snackBar1);
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          final smsCode = await getSmsCodeFromUser(context);

          if (smsCode != null) {
            // Create a PhoneAuthCredential with the code
            final credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: smsCode,
            );

            // Sign the user in (or link) with the credential
            final result =
                await FirebaseAuth.instance.signInWithCredential(credential);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavigationScreen()));
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      print("numberka wuu jiraa");
    }
  }

  // Check sms fucntion: TODO

  @override
  Widget build(BuildContext context) {
    AppContext.context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
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
                    child: TextField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            size: 40,
                          ),
                          prefixText: "+252",
                          hintText: "Phone",
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
              height: 20,
            ),
// small boxes

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MaterialButton(
                onPressed: () {
                  if (_phoneNumberController.text.length == 9) {
                    Future<void> readPhoneNumbers() async {
                      final querySnapshot =
                          await _instance.collection('Users').get();
                      if (querySnapshot.docs.isNotEmpty) {
                        for (final documentSnapshot in querySnapshot.docs) {
                          final phoneNumber =
                              documentSnapshot.data()['phoneNumber'];

                          final passingPhone =
                              "252" + _phoneNumberController.text;

                          if (phoneNumber == passingPhone) {
                            isFound = true;
                            userName = documentSnapshot.data()['name'];
                            sendSMS("+252" + _phoneNumberController.text);
                          }
                        }
                        if (isFound == false) {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar3);
                        }
                      }
                    }

                    readPhoneNumbers();
                  } else {
                    const snackBar2 = SnackBar(
                        content:
                            Text("Number-ka wuu gaaban yahay. Dhamaystir."));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar2);
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
