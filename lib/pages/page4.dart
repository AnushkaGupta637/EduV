import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Import animated_text_kit
import 'page7.dart'; // Import page7
import 'compo.dart'; // Import the YellowRoundedText component
import 'page5.dart'; // Import Page5

class AndroidSmall2 extends StatefulWidget {
  @override
  _AndroidSmall2State createState() => _AndroidSmall2State();
}

class _AndroidSmall2State extends State<AndroidSmall2> {
  bool _isSidePanelVisible = false;

  void _toggleSidePanel() {
    setState(() {
      _isSidePanelVisible = !_isSidePanelVisible;
    });
  }

  void _navigateToPage7() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Page7(prompt: ''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFFF7F3E8), // Background color
            child: Stack(
              children: [
                // Background and decorative shapes
                Positioned(
                  left: -width * 0.18,
                  top: height * 0.07,
                  child: Container(
                    width: width * 0.575,
                    height: height * 0.29,
                    decoration: ShapeDecoration(
                      color: Color(0xFF98647A).withOpacity(0.6),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.15,
                  top: -height * 0.06,
                  child: Container(
                    width: width * 0.63,
                    height: height * 0.33,
                    decoration: ShapeDecoration(
                      color: Color(0xFF98647A),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.61,
                  top: height * 0.1,
                  child: Container(
                    width: width * 0.28,
                    height: height * 0.14,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFCAE3F).withOpacity(0.9),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.86,
                  top: height * 0.275,
                  child: GestureDetector(
                    onTap: () {}, // No action for dialog now
                    child: Container(
                      width: width * 0.09,
                      height: height * 0.05,
                      decoration: ShapeDecoration(
                        color: Color(0xFFED5552).withOpacity(0.9),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.21,
                  top: height * 0.11,
                  child: Container(
                    width: width * 0.66,
                    height: height * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/giphy.gif"),
                        fit: BoxFit.cover, // Use BoxFit.cover or BoxFit.contain
                      ),
                    ),
                  ),
                ),

                // GestureDetector to toggle the side panel
                Positioned(
                  left: 0,
                  top: height * 0.0325,
                  child: GestureDetector(
                    onTap: _toggleSidePanel,
                    child: Container(
                      width: width * 0.15,
                      height: height * 0.048,
                      child: Icon(
                        Icons.menu,
                        size: width * 0.1, // Adjust size based on screen width
                        color: Color(0xFF031640), // Color of the menu icon
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: width * 0.73,
                  top: height * 0.02,
                  child: Container(
                    width: width * 0.27,
                    height: height * 0.14,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),

                // Greeting text with animation
                Positioned(
                  left: width * 0.064,
                  top: height * 0.555,
                  child: SizedBox(
                    width: width * 0.91,
                    height: height * 0.175,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Hey Nicole!\nReady for a quest?\nAsk away, and I\'ll help you out!',
                          textStyle: TextStyle(
                            color: Color(0xFF031640),
                            fontSize: width * 0.055,
                            fontFamily: 'Source Serif Pro',
                            fontWeight: FontWeight.w600,
                          ),
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: Duration(milliseconds: 500),
                    ),
                  ),
                ),

                // Static yellow rounded buttons
                YellowRoundedText(
                  text: 'How do I convert \ndecimals to fractions?➗',
                  width: width * 0.43,
                  top: height * 0.72,
                  left: width * 0.51,
                  fontSize: width * 0.03,
                ),
                YellowRoundedText(
                  text: 'What causes \nrainbows?🌈',
                  width: width * 0.43,
                  top: height * 0.82,
                  left: width * 0.06,
                  fontSize: width * 0.033,
                ),
                YellowRoundedText(
                  text: 'What is photosynthesis?🌿',
                  width: width * 0.43,
                  top: height * 0.82,
                  left: width * 0.51,
                  fontSize: width * 0.033,
                ),
                YellowRoundedText(
                  text: 'How plants grow?\n🌱',
                  width: width * 0.43,
                  top: height * 0.72,
                  left: width * 0.06,
                  fontSize: width * 0.033,
                ),

                // Yellow button design with text
                Positioned(
                  left: width * 0.3,
                  top: height * 0.91,
                  child: GestureDetector(
                    onTap: _navigateToPage7,
                    child: Container(
                      width: width * 0.42,
                      height: height * 0.078,
                      decoration: ShapeDecoration(
                        color: Color(0xFF031640),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2,
                            color: Color(0xFFC6BEBC),
                          ),
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Ask Questions',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Overlay the side panel if it's visible
          if (_isSidePanelVisible)
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: width * 0.55, // Responsive width for the side panel
                height: height,
                color: Color(0xFF031640),
                child: Page5(
                  onCloseSidePanel: _toggleSidePanel,
                ),
              ),
            ),
        ],
      ),
    );
  }
}