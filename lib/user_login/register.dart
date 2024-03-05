import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/homepage.dart';

import '../firebase_auth/firebase_authh.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);
  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  bool isSigningUp = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _textEditingController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String errorText = '';
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
          // Positioned widget for "New User?" text below the existing elements
          Positioned(
            top: MediaQuery.of(context).size.height /
                2.9, // Adjust the top position as needed
            left: 35, // Adjust the left position as needed
            child: const Text(
              '\t\t\t\t       New User?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(208, 140, 38, 1),
                fontFamily: 'Gorditas',
                fontSize: 35,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          // Positioned widget for the first Container with "Enter your full name" input

          Positioned(
            top: MediaQuery.of(context).size.height /
                2.4, // Adjust the top position as needed
            left: 35, // Adjust the left position as needed
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
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your full name',
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

          // Positioned widget for the second Container with "Enter your email" input

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

          // Positioned widget for the additional Container with "Enter password" input

          Positioned(
            top: MediaQuery.of(context).size.height /
                1.7, // Adjust the top position as needed
            left: 35, // Adjust the left position as needed
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
                    top: 16,
                    left: 21,
                    child: SizedBox(
                      width: 268, // Adjust width to fit the container
                      height: 25, // Adjust height to fit the container
                      child: TextField(
                        controller:
                            passwordController, // Use TextEditingController for password
                        obscureText: true, // Hide text as a password
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter password',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            fontFamily: 'Gorditas',
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        style: const TextStyle(
                          color: Color.fromRGBO(
                              0, 0, 0, 0.8), // Change text color if needed
                          fontSize: 20,
                          fontFamily: 'Gorditas',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ...Add other widgets on top of the image as needed...
          // Positioned widget for the additional Container with "Confirm password" input

          Positioned(
            top: MediaQuery.of(context).size.height /
                1.49, // Adjust the top position as needed
            left: 35, // Adjust the left position as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
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
                        top: 16,
                        left: 21,
                        child: SizedBox(
                          width: 268, // Adjust width to fit the container
                          height: 25, // Adjust height to fit the container
                          child: TextField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm password',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                                fontFamily: 'Gorditas',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            style: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.8),
                              fontSize: 20,
                              fontFamily: 'Gorditas',
                              fontWeight: FontWeight.normal,
                            ),
                            onChanged: (value) {
                              if (value != passwordController.text) {
                                setState(() {
                                  errorText = 'Passwords do not match';
                                });
                              } else {
                                setState(() {
                                  errorText = '';
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 5), // Adjust the space between input and error text
                errorText.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 21), // Adjust the left padding as needed
                        child: Text(
                          errorText,
                          style: const TextStyle(
                            color: Colors.red, // Error text color
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    : const SizedBox(), // Placeholder for error text when empty
              ],
            ),
          ),

// Positioned widget for the "Register" button at the bottom of the page
          Positioned(
            bottom: 100, // Adjust the bottom position as needed
            left: MediaQuery.of(context).size.width / 2 -
                120, // Center the button horizontally
            child: SizedBox(
              width: 240,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the homepage when the Register button is pressed
                  _signUp();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(225, 182, 117, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.53),
                    fontFamily: 'Gorditas',
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),

// Positioned widget for the "Already have an account? Sign in" text below the Register button
          Positioned(
            bottom: 80, // Adjust the bottom position as needed
            left: MediaQuery.of(context).size.width / 2 -
                110, // Center the text horizontally
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, 'login'); // Navigate to the login page
              },
              child: const Text(
                'Already have an account? Sign in',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors
                      .black, // You can replace 'undefined' with a color value
                  fontFamily: 'Gorditas',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _textEditingController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });

    if (user != null) {
      // User is successfully created, navigate to the home page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Some error occurred during sign-up
      // You may want to handle the error in a different way
      print("Some error occurred during sign-up");
    }
  }
}
