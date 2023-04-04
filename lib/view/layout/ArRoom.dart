
import '../../api/openai_service.dart';
import '../../theme/pallete.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ArRoom extends StatefulWidget {
  @override
  State<ArRoom> createState() => _ArRoomState();
}

class _ArRoomState extends State<ArRoom> {
  //const ArRoom({Key? key}) : super(key: key);
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
      Center(
        child: ModelViewer(src: 'assets/images/sitting_talking.glb',ar: true,
          arModes: ['scene-viewer', 'webxr', 'quick-look'],
          disableZoom: true,
          interactionPrompt: InteractionPrompt.auto,
          arPlacement: ArPlacement.floor,
          arScale: ArScale.auto,


          cameraControls: true,),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
