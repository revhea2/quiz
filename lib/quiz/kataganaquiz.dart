import 'package:flutter/material.dart';

import 'katagana_button.dart';

class LearnHiragana extends StatelessWidget {
  const LearnHiragana({Key key}) : super(key: key);




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          title:Text("Practice Katakana/Hiragana")
      ),

      body: OrientationBuilder(
        builder: (context, orientation) {
          bool isOrientationPortrait = orientation == Orientation.portrait;
          return Container(
            child: Center(
              child: isOrientationPortrait ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  KataganaButton(context, isOrientationPortrait, "katakana"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  KataganaButton(context, isOrientationPortrait, "hiragana"),
                ],
              ) : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KataganaButton(context,isOrientationPortrait, "katakana"),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  KataganaButton(context, isOrientationPortrait, "hiragana"),
                ],
              ),

              ),
          );}
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
