import 'package:flutter/material.dart';
import 'page9.dart'; // Make sure to import page9.dart
import 'todo.dart';

class Page5 extends StatelessWidget {
  final VoidCallback onCloseSidePanel;

  const Page5({Key? key, required this.onCloseSidePanel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background container
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: width * 0.55, // Adjusted width based on screen size
              height: height, // Adjusted height to full screen
              decoration: const BoxDecoration(color: Color(0xFF031640)),
            ),
          ),
          // Sidebar menu icon
          Positioned(
            left: width * 0.02, // Adjusted left position based on screen size
            top: height * 0.02, // Adjusted top position based on screen size
            child: GestureDetector(
              onTap: onCloseSidePanel,
              child: Container(
                width: width * 0.12, // Adjusted width based on screen size
                height: height * 0.05, // Adjusted height based on screen size
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "images/sidebar_icon.png"), // Updated path to sidebar icon
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          // New Chat button
          Positioned(
            left: width * 0.05, // Adjusted left position based on screen size
            top: height * 0.1, // Adjusted top position based on screen size
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE7FA15),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.black, size: width * 0.04),
                  SizedBox(width: width * 0.02),
                  Text(
                    'New Chat',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Menu items
          Positioned(
            left: width * 0.05, // Adjusted left position based on screen size
            top: height * 0.2, // Adjusted top position based on screen size
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page9()),
                    );
                  },
                  child: menuItem('Flashcards', width),
                ),
                SizedBox(height: height * 0.03),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TodoListPage()),
                    );
                  },
                  child: menuItem('To-Do', width),
                ),
                SizedBox(height: height * 0.03),
                menuItem('Resources', width),
                SizedBox(height: height * 0.03),
                menuItem('AI Tutor', width),
                SizedBox(height: height * 0.03),
                menuItem('History', width),
                SizedBox(height: height * 0.03),
                menuItem1('Recents', width),
                SizedBox(height: height * 0.2),
              ],
            ),
          ),
          // Settings icon
          menuIcon(
            'images/setting.png',
            'Settings',
            width * 0.08,
            width * 0.08,
            width * 0.06,
            left: width * 0.05,
            top: height * 0.8, // Adjusted top position for Settings
          ),
          // Username icon
          menuIcon(
            'images/user.png',
            'Username',
            width * 0.08,
            width * 0.08,
            width * 0.06,
            left: width * 0.05,
            top: height * 0.9, // Adjusted top position for Username
          ),
        ],
      ),
    );
  }

  Widget menuItem(String title, double width) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: width * 0.05, // Adjusted font size based on screen width
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget menuItem1(String title, double width) {
    return Text(
      title,
      style: TextStyle(
        color: const Color(0xff666666),
        fontSize: width * 0.05, // Adjusted font size based on screen width
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget menuIcon(String imagePath, String label, double width, double height,
      double fontSize,
      {required double left, required double top}) {
    return Positioned(
      left: left,
      top: top,
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: width,
            height: height,
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize:
              fontSize, // Adjusted font size based on passed parameter
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
