import 'package:flutter/material.dart';
import 'page5.dart'; // Import Page5
import 'page8.dart'; // Import Page8
import 'geometry.dart'; // Import GeometryQuizPage
import 'uom.dart';
import 'solarsystem.dart';
import 'layersofearth.dart';
import 'humanheart.dart';
import 'topic2.dart';
import 'topic3.dart';
import 'topic4.dart';
import 'topic5.dart';

class Page9 extends StatefulWidget {
  @override
  _Page9State createState() => _Page9State();
}

class _Page9State extends State<Page9> {
  bool _isSidePanelVisible = false;

  void _toggleSidePanel() {
    setState(() {
      _isSidePanelVisible = !_isSidePanelVisible;
    });
  }

  final List<String> _topicNames = [
    'Topic 1: Photosynthesis',
    'Topic 2: States of Matter',
    'Topic 3: Historical Monuments',
    'Topic 4: Weather and Climate',
    'Topic 5: Magnets',
    'Topic 6: Geometry',
    'Topic 7: Units of Measurements',
    'Topic 8: Solar System',
    'Topic 9: Layers of Earth',
    'Topic 10 : Human Heart',
  ];

  void _navigateToPage8() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page8()),
    );
  }

  void _navigateToTopic2() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Topic2()),
    );
  }

  void _navigateToTopic3() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Topic3()),
    );
  }

  void _navigateToTopic4() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Topic4()),
    );
  }

  void _navigateToTopic5() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Topic5()),
    );
  }

  void _navigateToGeometryQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GeometryQuizPage()), // Navigate to GeometryQuizPage
    );
  }

  void _navigateToUom() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Uom()), // Navigate to GeometryQuizPage
    );
  }

  void _navigateToSolarSystem() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SolarSystem()), // Navigate to GeometryQuizPage
    );
  }
  void _navigateToLayersOfEarth() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LayersOfEarth()), // Navigate to GeometryQuizPage
    );
  }

  void _navigateToHumanHeart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HumanHeart()), // Navigate to GeometryQuizPage
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
            width: width,
            height: height,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
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
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width * -0.18,
                  top: height * 0.07,
                  child: Container(
                    width: width * 0.575,
                    height: height * 0.292,
                    decoration: ShapeDecoration(
                      color: Color(0xFF031640),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.15,
                  top: height * -0.058,
                  child: Container(
                    width: width * 0.633,
                    height: height * 0.333,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFCAE3F),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.608,
                  top: height * 0.105,
                  child: Container(
                    width: width * 0.278,
                    height: height * 0.136,
                    decoration: ShapeDecoration(
                      color: Color(0xFFED5552),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.858,
                  top: height * 0.275,
                  child: Container(
                    width: width * 0.091,
                    height: height * 0.051,
                    decoration: ShapeDecoration(
                      color: Color(0xE5E4FF1A),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.728,
                  top: height * 0.0325,
                  child: Container(
                    width: width * 0.239,
                    height: height * 0.067,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/eduv.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.194,
                  top: height * 0.109,
                  child: SizedBox(
                    width: width * 0.933,
                    height: height * 0.063,
                    child: Text(
                      'FLASHCARDS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.053,
                  top: height * 0.214,
                  child: Container(
                    width: width * 0.914,
                    height: height * 0.6,
                    child: ListView.builder(
                      itemCount: _topicNames.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            width: width * 0.914,
                            height: height * 0.06,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: width * 0.89,
                                    height: height * 0.053,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: width * 0.694,
                                  top: 0,
                                  child: Container(
                                    width: width * 0.197,
                                    height: height * 0.053,
                                    decoration:
                                    BoxDecoration(color: Color(0xFFE8AA14)),
                                  ),
                                ),
                                Positioned(
                                  left: width * 0.044,
                                  top: height * 0.014,
                                  child: SizedBox(
                                    width: width * 0.761,
                                    height: height * 0.023,
                                    child: Text(
                                      _topicNames[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                if (index == 0)
                                  Positioned(
                                    left: width * 0.736,
                                    top: height * 0.014,
                                    child: GestureDetector(
                                      onTap: _navigateToPage8,
                                      child: SizedBox(
                                        width: width * 0.178,
                                        height: height * 0.045,
                                        child: Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (index == 1)
                                  Positioned(
                                    left: width * 0.736,
                                    top: height * 0.014,
                                    child: GestureDetector(
                                      onTap: _navigateToTopic2,
                                      child: SizedBox(
                                        width: width * 0.178,
                                        height: height * 0.045,
                                        child: Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (index == 2)
                                  Positioned(
                                    left: width * 0.736,
                                    top: height * 0.014,
                                    child: GestureDetector(
                                      onTap: _navigateToTopic3,
                                      child: SizedBox(
                                        width: width * 0.178,
                                        height: height * 0.045,
                                        child: Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (index == 3)
                                  Positioned(
                                    left: width * 0.736,
                                    top: height * 0.014,
                                    child: GestureDetector(
                                      onTap: _navigateToTopic4,
                                      child: SizedBox(
                                        width: width * 0.178,
                                        height: height * 0.045,
                                        child: Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (index == 4)
                                  Positioned(
                                    left: width * 0.736,
                                    top: height * 0.014,
                                    child: GestureDetector(
                                      onTap: _navigateToTopic5,
                                      child: SizedBox(
                                        width: width * 0.178,
                                        height: height * 0.045,
                                        child: Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (index == 5) // Topic 6
                                  Positioned(
                                    left: width * 0.736,
                                    top: height * 0.014,
                                    child: GestureDetector(
                                      onTap: _navigateToGeometryQuizPage,
                                      child: SizedBox(
                                        width: width * 0.178,
                                        height: height * 0.045,
                                        child: Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (index == 6) // Topic 6
                                  Positioned(
                                    left: width * 0.736,
                                    top: height * 0.014,
                                    child: GestureDetector(
                                      onTap: _navigateToUom,
                                      child: SizedBox(
                                        width: width * 0.178,
                                        height: height * 0.045,
                                        child: Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (index == 7) // Topic 6
                                  Positioned(
                                    left: width * 0.736,
                                    top: height * 0.014,
                                    child: GestureDetector(
                                      onTap: _navigateToSolarSystem,
                                      child: SizedBox(
                                        width: width * 0.178,
                                        height: height * 0.045,
                                        child: Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (index == 8) // Topic 6
                                  Positioned(
                                    left: width * 0.736,
                                    top: height * 0.014,
                                    child: GestureDetector(
                                      onTap: _navigateToLayersOfEarth,
                                      child: SizedBox(
                                        width: width * 0.178,
                                        height: height * 0.045,
                                        child: Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (index == 9) // Topic 6
                                  Positioned(
                                    left: width * 0.736,
                                    top: height * 0.014,
                                    child: GestureDetector(
                                      onTap: _navigateToHumanHeart,
                                      child: SizedBox(
                                        width: width * 0.178,
                                        height: height * 0.045,
                                        child: Text(
                                          'START',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
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
                width: width * 0.55,
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