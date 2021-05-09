import 'package:flutter/material.dart';
import 'package:quizz/MainApp.dart';

class GoodLuck extends StatefulWidget {
  static const id = 'goodLuck';
  const GoodLuck({Key key}) : super(key: key);

  @override
  _GoodLuckState createState() => _GoodLuckState();
}

class _GoodLuckState extends State<GoodLuck> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, MainApp.id);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Image.asset('assets/goodluck.jpg'));
  }
}
