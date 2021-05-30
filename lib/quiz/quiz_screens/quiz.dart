import 'dart:math';

import 'package:flutter/material.dart';

import '../../writing_systems/hiragana.dart';
import '../../writing_systems/katakana.dart';

class Quiz extends StatefulWidget {

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Map questions = {};
  List<String> pastQuestions = [];
  String currentQuestion = "";
  List<String> choices = [];
  Random randomizer = Random();
  int limit = 10;
  List<int> score = [];
  int totalPoints=0, counter=0;


  void generateQuestion(){
    setState(() {
      //selects a random character
      currentQuestion = questions.keys.elementAt(randomizer.nextInt(questions.length));
      while(pastQuestions.contains(currentQuestion)){
        currentQuestion = questions.keys.elementAt(randomizer.nextInt(questions.length));
      }

      //selects random answers
      choices = [questions[currentQuestion]];
      while(choices.length < 3){
          String character = questions.keys.elementAt(randomizer.nextInt(questions.length));
          if(choices.contains(questions[character])){
            continue;
          }
          choices.add(questions[character]);
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
      if(answer == questions[currentQuestion]){
        score.add(1);
        compute();
        pastQuestions.add(currentQuestion);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 25));
    final arguments = ModalRoute.of(context).settings.arguments as Map;

    for(String writingSystem in arguments['ws']){
      if (writingSystem == "Hiragana"){
        for(String kana in arguments['kana']){
          this.questions.addAll(Hiragana().getQuestions(kana));
        }
      }else{
        for(String kana in arguments['kana']){
          this.questions.addAll(Katakana().getQuestions(kana));
        }
      }
    }

    generateQuestion();
    return Scaffold(

      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(currentQuestion, style: TextStyle(fontSize: 150, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [
                ElevatedButton(
                  child: Text(choices[0]),
                  style: style,
                  onPressed: (){
                    checkAnswer(choices[0]);
                  },
                ),
                ElevatedButton(
                  child: Text(choices[1]),
                  style: style,
                  onPressed: (){
                    checkAnswer(choices[1]);
                  },
                ),
                ElevatedButton(
                  child: Text(choices[2]),
                  style: style,
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
