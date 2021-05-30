import 'dart:io';
import 'dart:math';
import 'dart:ui';

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
  List<int> score = [];
  int totalPoints=0, counter=0;


  void generateQuestion(){
    setState(() {

      counter++;
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
      }
      pastQuestions.add(currentQuestion);
      generateQuestion();
    });
  }

  getSize(context, percent){
    return MediaQuery.of(context).size.height * percent;
  }

  Widget choiceButtons(context, choiceText){
    return Padding(
      child: OutlinedButton(
        child: Text(choiceText, style: TextStyle(fontSize:getSize(context, 0.025))),
        onPressed: (){
          checkAnswer(choiceText);
        },
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          padding: EdgeInsets.fromLTRB(getSize(context, 0.09),getSize(context, 0.02),getSize(context, 0.09),getSize(context, 0.02))
        ),
      ),
      padding: EdgeInsets.fromLTRB(0,getSize(context, 0.01),0,0),
    );


  }



  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;

    if(questions.length == 0){
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
    }


    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          disabledColor: Colors.amber,
          icon: const Icon(Icons.close),
          iconSize: getSize(context, 0.04),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: counter < questions.length? Row(
          children: [
            Text("Current score:  ", style: TextStyle(color: Colors.white, fontSize: getSize(context, 0.032), fontWeight: FontWeight.bold)),
            Text("$totalPoints", style: TextStyle(color: Colors.lightGreenAccent, fontSize: getSize(context, 0.032))),
            Text("/", style: TextStyle(color: Colors.white70, fontSize: getSize(context, 0.032))),
            Text("${questions.length}", style: TextStyle(color: Colors.white70, fontSize: getSize(context, 0.032)))
          ]
        ): null,
      ),


      body: SingleChildScrollView(
        child: Center(
          child: counter < questions.length? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getSize(context, 0.06)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffffec9e),
                  padding: EdgeInsets.fromLTRB(getSize(context, 0.02),0,getSize(context, 0.02),0)
                ),
                child:  Text(currentQuestion, style: TextStyle(color: Colors.black87, fontSize: getSize(context, 0.23), fontWeight: FontWeight.bold)),
              ),

              SizedBox(height: getSize(context, 0.05)),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                children: [
                  choiceButtons(context, choices[0]),
                  choiceButtons(context, choices[1]),
                  choiceButtons(context, choices[2]),
                ],
              ),
            ],
          ):
              Column(
                children: [
                  Padding(
                    child: Text("You scored $totalPoints out of ${questions.length}",style: TextStyle(fontFamily: 'OdibeeSans-Regular', fontSize:  getSize(context, 0.055))),
                    padding:  EdgeInsets.fromLTRB(0, getSize(context, 0.07), 0, getSize(context, 0.06)),
                  ),
                  totalPoints < (questions.length*0.75).floor()?
                    Padding(
                      child: Text('You failed. But remember - the best way to get better is to practice.',style: TextStyle(fontFamily: 'Handlee-Regular', fontSize:  getSize(context, 0.03)),textAlign: TextAlign.center),
                      padding:  EdgeInsets.fromLTRB(getSize(context, 0.07), getSize(context, 0.06), getSize(context, 0.07), getSize(context, 0.06)),
                    ): Padding(
                      child: Text('You passed! You did good job getting this far!',style: TextStyle(fontFamily: 'Handlee-Regular', fontSize:  getSize(context, 0.03)),textAlign: TextAlign.center),
                      padding:  EdgeInsets.fromLTRB(getSize(context, 0.07), getSize(context, 0.06), getSize(context, 0.07), getSize(context, 0.06)),
                    ),
                    totalPoints < (questions.length*0.75).floor()?
                      Image.asset("assets/gambatte.gif", height: getSize(context, 0.3))
                        : Image.asset("assets/good-job.gif", height: getSize(context, 0.3)),




                ],
              )
        ),


      ),
    );
  }
}
