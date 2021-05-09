import 'package:flutter/material.dart';
import 'GoodLuck.dart';
import 'MainApp.dart';

void main() {
  runApp(Quizz());
}

class Quizz extends StatefulWidget {
  const Quizz({Key key}) : super(key: key);

  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: GoodLuck.id,
        routes: {
          GoodLuck.id: (context) => GoodLuck(),
          MainApp.id: (context) => MainApp(),
        });
  }
}
