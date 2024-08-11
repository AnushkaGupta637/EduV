// Import the Flutter material package
import 'package:flutter/material.dart';

// Define a stateful widget for the Geometry Quiz Page
class Topic2 extends StatefulWidget {
  @override
  _Topic2State createState() => _Topic2State();
}

class _Topic2State extends State<Topic2> {
  bool _isSidePanelOpen = false;
  int _selectedAnswer = -1; // Variable to keep track of selected answer
  int _currentQuestionIndex = 0; // Index of the current question
  bool _isCorrect = false; // Variable to check if the selected answer is correct

  // List of questions and answers
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'In which state of matter are the particles packed tightly together and have a fixed shape and volume?',
      'options': [
        'Liquid',
        'Gas',
        'Solid',
        'Plasma',
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Which state of matter has a definite volume but can change shape to fit its container?',
      'options': [
        'Solid',
        'Liquid',
        'Gas',
        'Plasma',
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'In which state of matter do the particles spread out and move freely?',
      'options': [
        'Solid',
        'Liquid',
        'Gas',
        'Plasma',
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'What happens to a solid when it is heated and changes into a liquid?',
      'options': [
        'The particles move closer together',
        'The particles spread out and move freely',
        'The particles stay in a fixed position',
        'The particles move around each other',
      ],
      'correctAnswer': 3,
    },
    {
      'question': 'Which of the following is an example of a substance in the liquid state?',
      'options': [
        'Rock',
        'Steam',
        'Water',
        'Ice',
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Which of the following is an example of a substance in the liquid state?',
      'options': [
        'Rock',
        'Steam',
        'Water',
        'Ice',
      ],
      'correctAnswer': 2,
    },
  ];

  // Method to toggle the side panel
  void _toggleSidePanel() {
    setState(() {
      _isSidePanelOpen = !_isSidePanelOpen;
    });
  }

  // Method to check the selected answer
  void _checkAnswer(int index) {
    setState(() {
      _selectedAnswer = index;
      _isCorrect = _selectedAnswer == _questions[_currentQuestionIndex]['correctAnswer'];
    });
  }

  // Method to move to the next question
  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _selectedAnswer = -1; // Reset selected answer for the new question
        _isCorrect = false; // Reset correctness for the new question
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Side Panel
          Positioned(
            left: _isSidePanelOpen ? 0 : -screenWidth * 0.7,
            top: 0,
            child: Container(
              width: screenWidth * 0.7,
              height: screenHeight,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  GestureDetector(
                    onTap: _toggleSidePanel,
                    child: Container(
                      width: screenWidth * 0.6,
                      height: screenHeight * 0.07,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Side Panel',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  // Menu Options with Bullet Icons
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(8.0),
                      children: [
                        _buildMenuItem(Icons.circle, 'Help'),
                        _buildMenuItem(Icons.circle, 'Settings'),
                        _buildMenuItem(Icons.circle, 'Username'),
                        // Add more menu items here if needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main content
          Positioned(
            left: screenWidth * 0.05,
            top: screenHeight * 0.23,
            child: Container(
              width: screenWidth * 0.91,
              height: screenHeight * 0.55,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: screenHeight * 0.01,
                    child: Container(
                      width: screenWidth * 0.89,
                      height: screenHeight * 0.54,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 3.02,
                    top: 3.74,
                    child: Container(
                      width: screenWidth * 0.89,
                      height: screenHeight * 0.54,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 6.04,
                    top: 0,
                    child: Container(
                      width: screenWidth * 0.89,
                      height: screenHeight * 0.54,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.15,
            top: screenHeight * 0.26,
            child: SizedBox(
              width: screenWidth * 0.24,
              height: screenHeight * 0.03,
              child: Text(
                'Question ${_currentQuestionIndex + 1}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.04,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.16,
            top: screenHeight * 0.32,
            child: SizedBox(
              width: screenWidth * 0.71,
              height: screenHeight * 0.08,
              child: Text(
                _questions[_currentQuestionIndex]['question'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.037,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ..._buildAnswerOptions(screenWidth, screenHeight),

          if (_isCorrect)
            Positioned(
              left: screenWidth * 0.5 - 40, // Centering the button
              top: screenHeight * 0.7,
              child: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Correct',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nextQuestion,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  // Build answer options dynamically
  List<Widget> _buildAnswerOptions(double screenWidth, double screenHeight) {
    final options = _questions[_currentQuestionIndex]['options'] as List<String>;
    return List<Widget>.generate(
      options.length,
          (index) => _buildAnswerOption(
        index,
        options[index],
        screenWidth,
        screenHeight,
      ),
    );
  }

  // Build a single answer option
  Widget _buildAnswerOption(
      int index, String text, double screenWidth, double screenHeight) {
    return Positioned(
      left: screenWidth * 0.16,
      top: screenHeight * (0.42 + index * 0.07),
      child: GestureDetector(
        onTap: () => _checkAnswer(index),
        child: Row(
          children: [
            Icon(
              _selectedAnswer == index
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.black,
            ),
            SizedBox(width: screenWidth * 0.02),
            SizedBox(
              width: screenWidth * 0.66,
              height: screenHeight * 0.05,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.035,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build a menu item for the side panel
  Widget _buildMenuItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {},
    );
  }
}
