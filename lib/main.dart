import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/address.dart';
import 'package:untitled/login.dart';
import 'package:untitled/register.dart';
import 'package:untitled/start.dart';

import 'firebase_options.dart';

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
    },
  ));
}
