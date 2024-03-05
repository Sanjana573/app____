import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firebase_auth/firebase_authh.dart';
import 'login.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Paaword reset link set! Check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:
          false, // Set background color of Scaffold to white
      body: Stack(
        children: [
          // Positioned animated image covering 1/3rd of the screen
          Positioned(
            top: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Image.asset(
              'assets/Dailyui001signup1.png',
              fit: BoxFit.cover,
            ),
          ),
          // Positioned text on top of the image
          Positioned(
            top: MediaQuery.of(context).size.height /
                6, // Adjust the top position as needed
            left: 35, // Adjust the left position as needed
            child: const Text(
              'Welcome to\nHello Mobiles',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(12, 15, 72, 0.8),
                fontFamily: 'Gorditas',
                fontSize: 50, // Adjust the font size as needed
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height /
                2.9, // Adjust the top position as needed
            left: 35, // Adjust the left position as needed
            child: const Text(
              '\t\t\t\t    Reset Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepOrange,
                fontFamily: 'Gorditas',
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          // Define a controller to handle the input text

// Inside the widget build method or somewhere appropriate in your code
          Positioned(
            top: MediaQuery.of(context).size.height / 2.4,
            left: 35,
            child: SizedBox(
              width: 310,
              height: 57,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 310,
                      height: 57,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          )
                        ],
                        color: const Color.fromRGBO(238, 237, 237, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21.0),
                      child: TextField(
                        controller: emailController, // Assign the controller
                        decoration: const InputDecoration(
                          hintText: 'Enter email',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            fontFamily: 'Gorditas',
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.8),
                          fontFamily: 'Gorditas',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        // Add onChanged or other properties as needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height / 1.8,
            left: 70,
            child: SizedBox(
              width: 240,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  passwordReset().then((_) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyLogin()), // Replace LoginPage() with your login page widget
                    );
                  });
                },

                // Navigate to the homepage when the login button is pressed

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(225, 182, 117, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text(
                  'Send Reset Link',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5299999713897705),
                    fontFamily: 'Gorditas',
                    fontSize: 32,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
