import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/benson.jpeg'),
              ),
              Text(
                'Benson Willems',
                style: TextStyle(
                    color: Colors.white, fontSize: 50, fontFamily: 'Pacifico'),
              ),
              Text(
                'CANINE MOBILE DEVELOPER',
                style: TextStyle(
                    color: Colors.teal.shade100,
                    fontSize: 25,
                    letterSpacing: 6),
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: Divider(color: Colors.teal.shade100,),
              ),
              Card(
                margin: EdgeInsets.only(
                  left: 150,
                  right: 150,
                  top: 10,
                ),
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.phone,
                          color: Colors.teal,
                          size: 25,
                        ),
                      ),
                      Text(
                        '+55 81 99999 99999',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.only(
                  top: 20,
                  left: 150,
                  right: 150,
                ),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.email,
                          color: Colors.teal,
                          size: 25,
                        ),
                      ),
                      Text(
                        'funhausbenson@gmail.com',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

class NameBox extends StatelessWidget {
  final String name;
  final String fontFamily;
  final double fontSize;

  NameBox(this.name, {this.fontFamily, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          fontSize: fontSize, color: Colors.white, fontFamily: fontFamily),
    );
  }
}
