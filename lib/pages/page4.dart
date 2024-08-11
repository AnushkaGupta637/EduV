import 'package:flutter/material.dart';
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
            color: Colors.white,
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
                      color: Color(0x99B97375),
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
                      color: Color(0xFFB97375),
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
                      color: Color(0xE5E8AA14),
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
                        color: Color(0xE5E4FF1A),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.09,
                  top: height * 0.05,
                  child: Container(
                    width: width * 0.86,
                    height: height * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/boyaa.png"),
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/hamburger.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: width * 0.73,
                  top: height * 0.0325,
                  child: Container(
                    width: width * 0.24,
                    height: height * 0.067,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/eduv.jpg"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(720),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),

                // Greeting text
                Positioned(
                  left: width * 0.064,
                  top: height * 0.555,
                  child: SizedBox(
                    width: width * 0.91,
                    height: height * 0.175,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hey Username,\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.055,
                              fontFamily: 'Source Serif Pro',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text:
                            'Ready for a quest?\nAsk away, and I\'ll help you out!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.055,
                              fontFamily: 'Source Serif Pro',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // YellowRoundedText components
                YellowRoundedText(
                  text: 'How do I convert \ndecimals to fractions?➗',
                  width: width * 0.43,
                  top: height * 0.705,
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
                        color: Color(0xFFE4FF1A),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Ask Questions',
                          style: TextStyle(
                            color: Colors.black,
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
                color: Color(0xFF2D2D34),
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