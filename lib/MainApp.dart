import 'package:flutter/material.dart';
import 'questionsBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MainApp extends StatefulWidget {
  static const id = 'mainApp';
  MainApp({Key key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int questionNumber = 0;
  int score = 0;
  void controller() {
    if (questionNumber == questions.length - 1) {
      Alert(context: context, title: "your score is", desc: "$score out of ${questions.length}").show();
      questionNumber = 0;
      score=0;
    } else {
      questionNumber += 1;
    }
  }

  int check(int choiceNumber) {
    if (choiceNumber == questions[questionNumber][4]) {
      score++;
    }
    print(score);
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
            title: Center(child: Text('E X A M')),
            backgroundColor: Colors.indigo[800]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //----QUESTIONS----
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    '${questions[questionNumber][0]}',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            //----FIRST CHOICE----
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                  child: Text(
                    '${questions[questionNumber][1]}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    setState(() {
                      check(questions[questionNumber][1]);
                      controller();
                    });
                  },
                ),
              ),
            ),
            //----SECOND CHOICE----
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                  child: Text(
                    '${questions[questionNumber][2]}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    setState(() {
                      check(questions[questionNumber][2]);
                      controller();
                    });
                  },
                ),
              ),
            ),
            //----T H I R D  C H O I C E----
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                  child: Text(
                    '${questions[questionNumber][3]}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    setState(() {
                      check(questions[questionNumber][3]);
                      controller();
                    });
                  },
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  '      Question: ${questionNumber+1} of ${questions.length}',
                  style: TextStyle(fontSize: 10, color: Colors.deepPurple),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
