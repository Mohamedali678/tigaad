import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  registerUser(String name, String email, String phoneNumber) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: "112345678");

    await _firestore.collection("user").doc(credential.user!.uid).set({
      "name": name,
      "email": email,
      "number": phoneNumber,
      "uid": credential.user!.uid
    });
  }
}
