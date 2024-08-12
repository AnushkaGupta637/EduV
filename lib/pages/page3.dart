import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'page4.dart';

class AndroidSmall13 extends StatefulWidget {
  @override
  _AndroidSmall13State createState() => _AndroidSmall13State();
}

class _AndroidSmall13State extends State<AndroidSmall13> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String _errorMessage = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      setState(() {
        _errorMessage = 'Passwords do not match';
      });
      return;
    }

    try {
      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // On successful signup, navigate to the next page
      Navigator.pushNamed(context, '/page4');
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? 'An unknown error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFFF7F3E8)), // Light beige background
        child: Stack(
          children: [
            // Colorful Circles
            Positioned(
              left: screenWidth * -0.1,
              top: screenHeight * 0.25,
              child: Container(
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
                decoration: ShapeDecoration(
                  color: Color(0xFF031640),
                  shape: CircleBorder(),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.15,
              top: screenHeight * 0.2,
              child: Container(
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                decoration: ShapeDecoration(
                  color: Color(0xFFFCAE3F),
                  shape: CircleBorder(),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.7,
              top: screenHeight * 0.35,
              child: Container(
                width: screenWidth * 0.2,
                height: screenWidth * 0.2,
                decoration: ShapeDecoration(
                  color: Color(0xFFED5552),
                  shape: CircleBorder(),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.85,
              top: screenHeight * 0.55,
              child: Container(
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
                decoration: ShapeDecoration(
                  color: Color(0xFF98647A),
                  shape: CircleBorder(),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.2,
              top: screenHeight * 0.1,
              child: Container(
                width: screenWidth * 0.6,
                height: screenHeight * 0.2,

              ),
            ),
            // SIGN UP Button
            Positioned(
              left: screenWidth * 0.2,
              top: screenHeight * 0.8, // Adjusted position
              child: GestureDetector(
                onTap: _signUp, // Trigger the signup function
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                    color: Color(0xFFFCAE3F), // Bright orange
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                        fontFamily: 'Kumbh Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // LOGIN Button at the Bottom
            Positioned(
              bottom: screenHeight * 0.1, // Positioned at the bottom
              left: screenWidth * 0.35, // Centered horizontally
              child: SizedBox(
                width: screenWidth * 0.3, // Reduced size
                height: screenHeight * 0.05, // Reduced height
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/page2');
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Color(0xFFED5552),
                      fontSize: screenWidth * 0.04, // Reduced font size
                      fontFamily: 'Kumbh Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            // Sign Up Text Above Fields
            Positioned(
              left: screenWidth * 0.2,
              top: screenHeight * 0.35, // Position above the username field
              child: SizedBox(
                width: screenWidth * 0.6,
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF031640), // Dark blue
                    fontSize: screenWidth * 0.06, // Adjust size as needed
                    fontFamily: 'Kumbh Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            // Text Fields
            Positioned(
              left: screenWidth * 0.2,
              top: screenHeight * 0.45,
              child: SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.05,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: Color(0xFF031640),
                      fontSize: screenWidth * 0.04,
                      fontFamily: 'Kumbh Sans',
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFF031640)),
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xFF031640),
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Kumbh Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.2,
              top: screenHeight * 0.52,
              child: SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.05,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Color(0xFF031640),
                      fontSize: screenWidth * 0.04,
                      fontFamily: 'Kumbh Sans',
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFF031640)),
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xFF031640),
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Kumbh Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.2,
              top: screenHeight * 0.59,
              child: SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.05,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Color(0xFF031640),
                      fontSize: screenWidth * 0.04,
                      fontFamily: 'Kumbh Sans',
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFF031640)),
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xFF031640),
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Kumbh Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.2,
              top: screenHeight * 0.66,
              child: SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.05,
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      color: Color(0xFF031640),
                      fontSize: screenWidth * 0.04,
                      fontFamily: 'Kumbh Sans',
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xFF031640)),
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xFF031640),
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Kumbh Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenWidth * 0.2,
              top: screenHeight * 0.73,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xFFED5552),
                  fontSize: screenWidth * 0.04,
                  fontFamily: 'Kumbh Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Display error message if signup fails
            if (_errorMessage.isNotEmpty)
              Positioned(
                left: screenWidth * 0.2,
                top: screenHeight * 0.68,
                child: Text(
                  _errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Kumbh Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
