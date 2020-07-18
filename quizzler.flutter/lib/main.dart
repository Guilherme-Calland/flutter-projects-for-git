import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'model/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> icons = [];

  List<Question> questions = Questions.questions;

  int qIndex = 0;
  Question currentQuestion;

  @override
  Widget build(BuildContext context) {
    currentQuestion = questions[qIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[qIndex].text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                if (qIndex < questions.length - 1) {
                  currentQuestion.value == true
                      ? icons.add(RightIcon())
                      : icons.add(WrongIcon());
                  qIndex++;
                } else {
                  showEndMessage(context);
                  resetQuestions();
                }
                setState(() {});
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                if (qIndex < questions.length - 1) {
                  currentQuestion.value == false
                      ? icons.add(RightIcon())
                      : icons.add(WrongIcon());
                  qIndex++;
                } else {
                  showEndMessage(context);
                  resetQuestions();
                }
                setState(() {});
              },
            ),
          ),
        ),
        Row(children: icons),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  void resetQuestions() {
    qIndex = 0;
    icons = [];
  }

  void showEndMessage(BuildContext context) {
    Alert(
        context: context,
        title: 'YOU CAVE FINISHED',
        desc: 'you might just be the smartest person on earth!',
        buttons: [
          DialogButton(
            child: Text('Reset Quiz'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]).show();
  }
}

class WrongIcon extends StatelessWidget {
  const WrongIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }
}

class RightIcon extends StatelessWidget {
  const RightIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check,
      color: Colors.green,
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
