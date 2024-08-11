import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback onClose;

  CustomDialog({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 240,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xFF2D2D34),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 16, // Adjust left position as needed
              top: 20, // Adjust top position as needed
              child: Text(
                'Generate Flashcards',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 16, // Adjust left position as needed
              top: 50, // Adjust top position as needed
              child: Text(
                'Add to Notes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
