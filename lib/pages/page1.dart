import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'page2.dart'; // Import page 2 from the pages folder

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Fade animation
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    // Scale animation
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start animations and navigate to Page2 after 5 seconds
    _animationController.forward().whenComplete(() {
      Navigator.pushReplacementNamed(context, '/page2');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return AndroidSmall1(
              screenHeight: constraints.maxHeight,
              screenWidth: constraints.maxWidth,
              scaleAnimation: _scaleAnimation,
            );
          },
        ),
      ),
    );
  }
}

class AndroidSmall1 extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final Animation<double> scaleAnimation;

  const AndroidSmall1({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: scaleAnimation,
            child: Image.asset(
              "images/logo.jpg",
              width: screenWidth * 0.8,
              height: screenHeight * 0.6,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}