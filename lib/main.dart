import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/page1.dart'; // Import page 1 from the pages folder
import 'pages/page2.dart'; // Import page 2 from the pages folder
import 'pages/page3.dart'; // Import page 3 from the pages folder
import 'pages/page4.dart'; // Import page 4 from the pages folder
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Page1(), // Page 1 as the initial page
        '/page2': (context) => AndroidSmall12(), // Page 2 route
        '/page3': (context) => AndroidSmall13(), // Page 3 route
        '/page4': (context) => AndroidSmall2(), // Page 4 route
      },
    );
  }
}
