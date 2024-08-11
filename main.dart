import 'package:flutter/material.dart';

import '../lib/pages/page1.dart'; // Import page 1 from the pages folder
import '../lib/pages/page2.dart'; // Import page 2 from the pages folder
import '../lib/pages/page3.dart'; // Import page 3 from the pages folder
import '../lib/pages/page4.dart'; // Import page 4 from the pages folder

void main() {
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
