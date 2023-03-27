import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  registerUser(String name, String email, String password) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection("user").doc(credential.user!.uid).set({
      "name": name,
      "email": email,
      "password": password,
      "uid": credential.user!.uid
    });
  }

  Future<void> logIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User logged in successfully
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
    // User logged out successfully
  }
}
