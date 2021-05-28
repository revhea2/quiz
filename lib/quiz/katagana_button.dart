import 'dart:ui';

import 'package:flutter/material.dart';

class KataganaButton extends StatelessWidget {

  final BuildContext parentContext;
  final bool isPortraitOrientation;
  final String writingSystem;

  KataganaButton(this.parentContext, this.isPortraitOrientation, this.writingSystem);


  @override
  Widget build(BuildContext context) {
    return  Container(
              width: isPortraitOrientation? MediaQuery.of(parentContext).size.width * 0.9: MediaQuery.of(parentContext).size.width * 0.45,
              height: isPortraitOrientation? MediaQuery.of(parentContext).size.height * 0.35: MediaQuery.of(parentContext).size.height * 0.6,
              decoration: BoxDecoration(
                  border: Border.all(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Column(
                          children: [
                            Text("Practice " + writingSystem, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            Text("カタカナの練習", style: TextStyle(fontSize: 30)),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/quiz', arguments: {'ws': this.writingSystem, 'type':"Main Kana"});
                              },
                              child: const Text("Main Kana  / メインかな"),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/quiz', arguments: {'ws': this.writingSystem, 'type':"Dakuten Kana"});
                              },
                              child: const Text("Dakuten Kana / だくてん かな"),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/quiz', arguments: {'ws': this.writingSystem, 'type':"Combination Kana"});
                              },
                              child: const Text("Combination Kana / コンビネーションかな"),
                            ),

                          ],
                      ),
                  ),
                ],
              ),
    );
  }

}
