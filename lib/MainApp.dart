import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'questionsBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'GoodLuck.dart';
import 'package:flutter/services.dart';

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
      Alert(
          type: AlertType.success,
          context: context,
          title: "DONE",
          desc: "your score is $score out of ${questions.length}",
          closeIcon: IconButton(
            icon: Icon(
              Icons.circle,
              color: Colors.red,
            ),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
          buttons: [
            DialogButton(
                child: Text(
                  'Try again',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, GoodLuck.id);
                })
          ],
          closeFunction: () {
            Navigator.pushNamed(context, MainApp.id);
            super.initState();
          }).show();
      questionNumber = 0;
      score = 0;
    } else {
      questionNumber += 1;
    }
  }



  int check(int choiceNumber) {
    if (choiceNumber == questions[questionNumber][4]) {
    AudioCache player= new AudioCache();
     player.play('sample1.wav');
      score++;
    }
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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '      Question: ${questionNumber + 1} of ${questions.length}',
                    style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
