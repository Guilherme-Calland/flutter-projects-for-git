import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    XilophoneApp(),
  );
}

class XilophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: XilophoneScreen(),
      ),
    );
  }
}

class XilophoneScreen extends StatefulWidget {
  @override
  _XilophoneScreenState createState() => _XilophoneScreenState();
}

class _XilophoneScreenState extends State<XilophoneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Note('note1', Colors.red),
          Note('note2', Colors.orange),
          Note('note3', Colors.yellow),
          Note('note4', Colors.green),
          Note('note5', Colors.teal),
          Note('note6', Colors.blue),
          Note('note7', Colors.purple),
        ],
      ),
    );
  }
}

class Note extends StatelessWidget {
  final String note;
  final Color color;

  Note(this.note, this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          final player = AudioCache();
          player.play('$note.wav');
          print('button pressed');
        },
      ),
    );
  }
}
