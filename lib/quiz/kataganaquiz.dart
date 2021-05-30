import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LearnHiragana extends StatefulWidget {
  const LearnHiragana({Key key}) : super(key: key);

  @override
  _LearnHiraganaState createState() => _LearnHiraganaState();
}

class _LearnHiraganaState extends State<LearnHiragana> {

  bool katakanaSelected = false, hiraganaSelected = false;
  bool mainKanaSelected = false, dakutenKanaSelected= false, combinationKanaSelected= false;



  void toggleSelect(int n){
    setState(() {
      if(n==1)
        katakanaSelected = !katakanaSelected;
      else if(n==2)
        hiraganaSelected = !hiraganaSelected;
      else if(n==3)
        mainKanaSelected = !mainKanaSelected;
      else if(n==4)
        dakutenKanaSelected = !dakutenKanaSelected;
      else
        combinationKanaSelected = !combinationKanaSelected;
    });
  }


  void proceedQuiz() {
    List<String> ws = [];
    List<String> kana = [];
    if(katakanaSelected){
      ws.add("Katakana");
    }
    if(hiraganaSelected){
      ws.add("Hiragana");
    }
    if(mainKanaSelected){
      kana.add("Main Kana");
    }
    if(dakutenKanaSelected){
      kana.add("Dakuten Kana");
    }
    if(combinationKanaSelected){
      kana.add("Combination Kana");
    }

    if(!katakanaSelected  && !hiraganaSelected){
      Alert(
        context: context,
        title: "Please select a writing system!",
      ).show();
      return;
    }

    if(!mainKanaSelected && !dakutenKanaSelected && !combinationKanaSelected){
      Alert(
        context: context,
        title: "Please select a kana!",
      ).show();
      return;
    }

    Navigator.pushNamed(context, '/quiz', arguments: {'ws': ws, 'kana': kana});

  }


  @override
  Widget katakanaButton(context){
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonTheme(
            minWidth: 200.0,
            height: 100.0,
            child: ElevatedButton(
              onPressed: () => toggleSelect(1),
              child: Image.asset("assets/fuji-mountain.png", height: 50),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                primary: katakanaSelected != null && katakanaSelected? Color(0xe6fcecdd): Colors.white,
                side: BorderSide(
                  color: Color(0xe6fea82f),
                  style: BorderStyle.solid,
                  width: katakanaSelected != null && katakanaSelected? 3: 1,
                ),
                padding: EdgeInsets.all(24),
              ),
            ),
          ),
          Padding(
            child: Text("Katakana",style: TextStyle(color: Color(0xe6333333), fontFamily: 'OdibeeSans-Regular', fontSize:  MediaQuery.of(context).size.height * 0.03)),
            padding:  EdgeInsets.fromLTRB(20, 20, 20, 20),
          ),
        ],
      ),

    );

  }

  Widget hiraganaButton(context){
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonTheme(
            minWidth: 200.0,
            height: 100.0,
            child: ElevatedButton(
              onPressed: () => toggleSelect(2),
              child: Image.asset("assets/fan.png", height: 50),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                primary: hiraganaSelected != null && hiraganaSelected? Color(0xe6fcecdd): Colors.white,
                side: BorderSide(
                  color: Color(0xe6fea82f),
                  style: BorderStyle.solid,
                  width: hiraganaSelected != null && hiraganaSelected? 3: 1,
                ),
                padding: EdgeInsets.all(24),
              ),
            ),
          ),
          Padding(
            child: Text("Hiragana",style: TextStyle(color: Color(0xe6333333), fontFamily: 'OdibeeSans-Regular', fontSize:  MediaQuery.of(context).size.height * 0.03)),
            padding:  EdgeInsets.fromLTRB(20, 20, 20, 20),
          ),
        ],
      ),

    );
  }

  Widget typeButton(type, jpType, context, n, active){
    return OutlinedButton(
      onPressed: () => toggleSelect(n),
      style: OutlinedButton.styleFrom(
        backgroundColor: active? Color(0xffff6701): Colors.white,
        onSurface: Colors.red,
        padding: EdgeInsets.all(16),
        side:  active != null && active? BorderSide(
          color: Color(0xfffea82f),
          width:  3,
        ): null,

      ),
      child: Text(type + " / " + jpType, style: TextStyle(color: active? Colors.white:Colors.black54, fontSize:  MediaQuery.of(context).size.height * 0.02)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  child: Text("Writing Systems",style: TextStyle(fontFamily: 'OdibeeSans-Regular', fontSize:  MediaQuery.of(context).size.height * 0.055)),
                  padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.03, 0, MediaQuery.of(context).size.height * 0.06),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    hiraganaButton(context),
                    katakanaButton(context),
                  ],
                ),
                Divider(),
                Padding(
                  child: Text("Select Kana:", style: TextStyle( color: Colors.black54,fontFamily: 'OdibeeSans-Regular', fontSize: MediaQuery.of(context).size.height * 0.03)),
                  padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, MediaQuery.of(context).size.height * 0.008),
                ),



                Column(
                  children: [
                    Padding(
                      child: typeButton("Main Kana","メインかな", context, 3, mainKanaSelected),
                      padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, MediaQuery.of(context).size.height * 0.008),
                    ),
                    Padding(
                      child: typeButton("Dakuten Kana", "だくてん かな",context, 4, dakutenKanaSelected),
                      padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, MediaQuery.of(context).size.height * 0.008),
                    ),
                    Padding(
                      child: typeButton("Combination Kana", "コンビネーションかな" , context, 5, combinationKanaSelected),
                      padding:  EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.02, 0, MediaQuery.of(context).size.height * 0.06),
                    ),
                    ElevatedButton(
                      onPressed: () => proceedQuiz(),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: EdgeInsets.all(16),

                      ),
                      child: Text("Let's Go!", style: TextStyle(fontFamily: 'NotoSans-Regular', fontSize: MediaQuery.of(context).size.height * 0.032),),
                    )
                  ],
                ),

                // KataganaButton(context, isOrientationPortrait, "katakana"),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                // KataganaButton(context, isOrientationPortrait, "hiragana"),
              ],
            ),
          ),
        ),
      ),


      bottomNavigationBar:  BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }

}
