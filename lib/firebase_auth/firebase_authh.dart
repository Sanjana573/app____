import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Handle the error without showing a toast
      } else {
        // Handle the error without showing a toast
      }
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        // Handle the error without showing a toast
      } else {
        // Handle the error without showing a toast
        print("Error during sign out: $e");
      }
      return null;
    }
  }

  Future<bool> signOutAndNavigateToLogin() async {
    try {
      print(_auth.currentUser);
      await _auth.signOut();
      print("User signed out");
      return true;
      // Navigate to the login page
      // You may need to replace LoginPage with your actual login page
      // Ensure that your navigation logic is set up correct
    } catch (e) {
      print("Error during sign out: $e");
      return false;
    }
  }
}
