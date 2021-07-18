import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? getUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  bool isSignedIn() {
    final currentUer = _firebaseAuth.currentUser;
    if (currentUer == null) {
      return false;
    }
    return true;
  }

  void isUserLogged(BuildContext context, String typeUser) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        if (typeUser == 'client') {
          Navigator.pushNamedAndRemoveUntil(
              context, 'client/map', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, 'driver/map', (route) => false);
        }
      }
    });
  }

  Future<bool> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);
      return false;
    }
    return true;
  }

  Future<bool> register(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (error) {
      print(error);
      return false;
    }
    return true;
  }
}
