import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'page5.dart';

class Page7 extends StatefulWidget {
  final String prompt; // Add prompt parameter

  Page7({required this.prompt}); // Constructor to receive prompt

  @override
  _Page7State createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = []; // Store messages and their types (user/ai)
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-1.5-flash', // Specify your model name
    apiKey: 'AIzaSyD_qA5VwiXQrRuwHHebOdBFL0Z15YCuiMo', // Replace with your actual API key
  );

  Future<void> _sendMessage() async {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({'type': 'user', 'text': message});
        _messages.add({'type': 'ai', 'text': 'Processing...'}); // Placeholder for AI response
      });
      _controller.clear();

      // Call the Gemini API
      try {
        final content = [Content.text(message)];
        final response = await _model.generateContent(content);
        setState(() {
          _messages[_messages.length - 1]['text'] = response.text ?? 'Error: No response';
        });
      } catch (e) {
        setState(() {
          _messages[_messages.length - 1]['text'] = 'Error: ${e.toString()}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2D34), // Background color from the provided image
      appBar: AppBar(
        title: Text('Chat Interface'),
        backgroundColor: Colors.black, // Match the design theme
      ),
      body: Column(
        children: [
          // Display the prompt text at the top
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.prompt, // Display prompt received from page4.dart
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                final isUserMessage = message['type'] == 'user';
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUserMessage
                          ? Color(0xFFE4FF1A)
                          : Color(0xFFFFE4B5), // User message color and AI message color
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      message['text']!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your questions here',
                      hintStyle: TextStyle(color: Color(0xFFA1A1A1)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFFE4FF1A), // Same color as the message box
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.send, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
