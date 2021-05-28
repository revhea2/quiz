import 'package:Practice/quiz/quiz_screens/quiz.dart';
import 'package:flutter/material.dart';

import 'quiz/kataganaquiz.dart';

void main() {
  runApp(LearnJaps());
}

class LearnJaps extends StatelessWidget {
  const LearnJaps({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LearnHiragana(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/quiz': (context) => Quiz(),

      },

    );
  }
}
