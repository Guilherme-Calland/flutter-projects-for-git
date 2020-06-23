import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PianoApp(),);
}

class PianoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: PianoScreen(),
      ),
    );
  }
}

class PianoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              WhiteKey('c'), WhiteKey('d'), WhiteKey('e'), WhiteKey('f'), WhiteKey('g'), WhiteKey('a'), WhiteKey('b'),
            ],
          ),
          Column()
        ],
      ),
    );
  }
}

class WhiteKey extends StatelessWidget {

  final String note;

  WhiteKey(this.note,);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: FlatButton(
          color: Colors.white,
          onPressed: (){
            final player = AudioCache();
            player.play('$note.m4a');
          },
        ),
      ),
    );
  }
}
