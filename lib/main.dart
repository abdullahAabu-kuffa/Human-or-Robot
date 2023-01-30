// ignore_for_file: prefer_const_constructors, unused_import, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';
import 'appBrain.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(const MyTest()); //StatelessWidget
}

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('MCQ'),
          backgroundColor: Colors.grey,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: ExamPage(),
        ), //StatefullWidget
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Padding> answerResult = [];
  int rightAnswer = 0;
  void check(bool p) {
    if (appBrain.getQuestionAnswer() == p) {
      rightAnswer++;
      answerResult.add(
        Padding(
          padding: EdgeInsets.all(4),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ),
      );
    } else {
      answerResult.add(
        const Padding(
          padding: EdgeInsets.all(4),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ),
      );
    }
    if (appBrain.isFinished() == true) {
      if (rightAnswer != 7) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "finished!",
          desc: "your right answer is $rightAnswer from 7 questions.",
          buttons: [
            DialogButton(
              child: Text(
                "😁حاول تاني يافاشل ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () => Navigator.pop(context),
              width: 200.0,
              height: 100.0,
            )
          ],
        ).show();
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "finished!",
          desc: "your right answer is $rightAnswer from 7 questions.",
          buttons: [
            DialogButton(
              child: Text(
                "براڤوو علييييييك😁❤",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () => Navigator.pop(context),
              width: 200.0,
              height: 100.0,
            )
          ],
        ).show();
      }
      appBrain.reset();
      rightAnswer = 0;
      answerResult.clear();
    } else {
      appBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appBrain.getQuestionImage()),
              const SizedBox(height: 15.0),
              Text(
                appBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    check(true);
                  },
                );
              },
              child: const Text(
                'True',
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
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    check(false);
                  },
                );
              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
