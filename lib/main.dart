import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/checkout/address.dart';
import 'package:untitled/start.dart';

import 'firebase_auth/firebase_options.dart';
import 'user_login/forgotpassword.dart';
import 'user_login/login.dart';
import 'user_login/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: 'start',
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'start': (context) => const Start(),
      'address': (context) => const AddressEntryPage(),
      'forgot': (context) => const ForgotPasswordPage(),
    },
  ));
}
