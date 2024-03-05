import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../firebase_auth/firebase_authh.dart';
import '../homepage.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              '\t\t\t\t         log in',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepOrange,
                fontFamily: 'Gorditas',
                fontSize: 40,
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
            top: MediaQuery.of(context).size.height / 2,
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
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21.0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            fontFamily: 'Gorditas',
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.8),
                          fontFamily: 'Gorditas',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        // You can add controllers, onChanged, or any other properties you need
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height / 1.7,
            left: 21,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, 'forgot'); // Navigate to the login page
              },
              child: const Text(
                '             Forgot password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(16, 16, 16, 1),
                  fontFamily: 'Gorditas',
                  fontSize: 23,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: 90,
            child: SizedBox(
              width: 240,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the homepage when the login button is pressed
                  _signIn(emailController.text.toString(),
                      passwordController.text.toString());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(225, 182, 117, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text(
                  'Log in',
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

          Positioned(
            bottom: 175,
            left: 21,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, 'register'); // Navigate to the login page
              },
              child: const Text(
                textAlign: TextAlign.center,
                '                  new user? Sign up',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  // Change color as needed
                  fontFamily: 'Gorditas',
                  fontSize: 23,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signIn(String email, String password) async {
    print("Email: $email, Password: $password");
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter email and password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Display success message
        Fluttertoast.showToast(
          msg: "Login successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        // Navigate to Home page
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseAuthException catch (ex) {
        print("Auth Exception: ${ex.message.toString()}");

        // Display error message
        Fluttertoast.showToast(
          msg: "Login failed. Check your credentials.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }
}
