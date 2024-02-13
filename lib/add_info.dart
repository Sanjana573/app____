import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class AddInfoPage extends StatefulWidget {
  @override
  _AddInfoPageState createState() => _AddInfoPageState();
}

class _AddInfoPageState extends State<AddInfoPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Save the information to Firestore
                _saveUserInfo();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ); // Go back to the previous screen
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveUserInfo() async {
    try {
      // Get a reference to the Firestore collection
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Add the user information to Firestore
      await users.add({
        'full_name': _fullNameController.text,
        'email': _emailController.text,
      });

      // Show a success message or navigate to the profile page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User information saved successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save user information'),
          duration: Duration(seconds: 2),
        ),
      );
      print('Error saving user information: $error');
    }
  }
}
