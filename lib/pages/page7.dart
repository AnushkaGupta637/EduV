import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_player/video_player.dart';

class Page7 extends StatefulWidget {
  final String prompt;

  Page7({required this.prompt});

  @override
  _Page7State createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final GenerativeModel _model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: "AIzaSyD_qA5VwiXQrRuwHHebOdBFL0Z15YCuiMo",
  );

  VideoPlayerController? _videoPlayerController;
  String? _errorMessage;
  bool _isVideoLoading = false;

  Future<String?> fetchVideoWithDelay(String prompt) async {
    await Future.delayed(Duration(seconds: 3));

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('videos')
          .where('title', isEqualTo: prompt) // Updated to query by title
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String videoUrl = querySnapshot.docs.first.get('path'); // Ensure this field contains the URL
        return videoUrl;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching video: $e');
      return null;
    }
  }

  void _sendMessage() async {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({'type': 'user', 'text': message});
        _messages.add({'type': 'ai', 'text': 'Processing...'});
      });
      _controller.clear();

      final content = [Content.text(message)];
      try {
        final response = await _model.generateContent(content);
        setState(() {
          _messages[_messages.length - 1]['text'] =
              response.text ?? 'Error: No response from AI';
        });

        setState(() {
          _isVideoLoading = true;
          _errorMessage = null;
        });

        String? videoUrl = await fetchVideoWithDelay(message);
        if (videoUrl != null) {
          setState(() {
            _videoPlayerController = VideoPlayerController.network(videoUrl)
              ..initialize().then((_) {
                setState(() {
                  _isVideoLoading = false;
                });
                _videoPlayerController?.play();
              }).catchError((error) {
                setState(() {
                  _isVideoLoading = false;
                  _errorMessage = 'Error initializing video: $error';
                });
              });
          });
        } else {
          setState(() {
            _isVideoLoading = false;
            _errorMessage = 'No video found for the provided prompt';
          });
        }
      } catch (e) {
        setState(() {
          _messages[_messages.length - 1]['text'] =
          'Error: ${e.toString()}';
          _isVideoLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031640),
      appBar: AppBar(
        title: Text(
          'Chat Interface',
          style: TextStyle(
            color: Color(0xFFED5552),
            fontFamily: 'Inter',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Color(0xffffffff),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.prompt,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
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
                          : Color(0xFFFFE4B5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      message['text']!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontStyle: isUserMessage
                            ? FontStyle.normal
                            : FontStyle.italic,
                        fontWeight: isUserMessage
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isVideoLoading)
            Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),
          if (_videoPlayerController != null &&
              _videoPlayerController!.value.isInitialized)
            AspectRatio(
              aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController!),
            ),
          if (_errorMessage != null)
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
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
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                      color: Color(0xFFE4FF1A),
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
