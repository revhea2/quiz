import 'dart:math';

import 'package:flutter/material.dart';

import '../../writing_systems/hiragana.dart';
import '../../writing_systems/katakana.dart';

class Quiz extends StatefulWidget {

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Map mainKana;
  List<String> pastQuestions;
  String currentQuestion;
  List<String> choices;
  Random randomizer;
  int limit;
  List<int> score = [];
  int totalPoints, counter;

  _QuizState(){
    randomizer = Random();
    pastQuestions = [];
    limit = 10;
    score = [];
    totalPoints = counter = 0;
  }

  void generateQuestion(){
    setState(() {
      //selects a random character
      currentQuestion = mainKana.keys.elementAt(randomizer.nextInt(mainKana.length));
      while(pastQuestions.contains(currentQuestion)){
        currentQuestion = mainKana.keys.elementAt(randomizer.nextInt(mainKana.length));
      }

      //selects random answers
      choices = [mainKana[currentQuestion]];
      while(choices.length < 3){
          String character = mainKana.keys.elementAt(randomizer.nextInt(mainKana.length));
          if(choices.contains(mainKana[character])){
            continue;
          }
          choices.add(mainKana[character]);
      }
      choices.shuffle();

    });
  }

  void compute(){
    this.totalPoints = 0;
    for(int i = 0; i < score.length; i++){
      this.totalPoints += score[i];
    }
  }


  void checkAnswer(String answer){
    setState(() {
      if(answer == mainKana[currentQuestion]){
        score.add(1);
        compute();
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
      if (arguments['ws'] == "hiragana"){
        this.mainKana = Hiragana().getQuestions(arguments['type']);
      }else{
        this.mainKana = Katakana().getQuestions(arguments['type']);
      }
    generateQuestion();

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['type'] + " (" + arguments['ws'] + ")"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(currentQuestion, style: TextStyle(fontSize: 300, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [
                ElevatedButton(
                  child: Text(choices[0]),
                  onPressed: (){
                    checkAnswer(choices[0]);
                  },
                ),
                ElevatedButton(
                  child: Text(choices[1]),
                  onPressed: (){
                    checkAnswer(choices[1]);
                  },
                ),
                ElevatedButton(
                  child: Text(choices[2]),
                  onPressed: (){
                    checkAnswer(choices[2]);
                  },
                ),
              ],
            ),
            Text(totalPoints == null? 0.toString(): totalPoints.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

          ],
        ),

      ),
    );
  }
}
