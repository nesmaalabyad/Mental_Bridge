import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../api/openai_service.dart';
import '../../theme/pallete.dart';

class VrRoom extends StatefulWidget {
  @override
  State<VrRoom> createState() => _VrRoomState();
}
class _VrRoomState extends State<VrRoom> {
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();


  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;



  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {

    await flutterTts.setVolume(1);
    await flutterTts.setPitch(1);
    await flutterTts.speak(content);


  }


  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          WebView(
            initialUrl: 'https://sketchfab.com/models/30fdcf0661054e2bb0dfb2b4fb14fe9e/embed?autostart=1&cardboard=1&internal=1&tracking=0&ui_infos=0&ui_snapshots=1&ui_stop=0&ui_watermark=0',
            javascriptMode: JavascriptMode.unrestricted,
          ),


      floatingActionButton: ZoomIn(

        delay: Duration(milliseconds: start + 3* delay),
        child: FloatingActionButton(

          backgroundColor: buttoncolor,
          onPressed: () async {
            if (await speechToText.hasPermission &&
                speechToText.isNotListening) {
              await startListening();
            } else if (speechToText.isListening) {
              final speech = await openAIService.isArtPromptAPI(lastWords);
              if (speech.contains('https')) {
                generatedImageUrl = speech;
                generatedContent = null;
                setState(() {});
              } else {
                generatedImageUrl = null;
                generatedContent = speech;
                setState(() {});
                await systemSpeak(speech);
              }
              await stopListening();
            } else {
              initSpeechToText();

            }
          },
          child: Icon(
            speechToText.isListening ? Icons.stop : Icons.mic,
          ),
        ),
      ),
    );
  }



}