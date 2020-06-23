import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MiCard(),
  );
}

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/gui.jpg'),
              ),
              Text(
                'Guilherme Calland',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                'MOBILE DEVELOPER',
                style: TextStyle(
                  color: Colors.teal.shade100,
                  fontSize: 15,
                  letterSpacing: 10,
                ),
              ),
              SizedBox(height: 20, width: 200, child: Divider(color: Colors.teal.shade100,),),
              MyMiCard('+55 81 99845 5497', Icons.phone,),
              MyMiCard('gui.crb0@gmail.com', Icons.email,)
            ],
          ),
        ),
      ),
    );
  }
}

class MyMiCard extends StatelessWidget {
  final String text;
  final IconData icon;
  MyMiCard(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.teal,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
