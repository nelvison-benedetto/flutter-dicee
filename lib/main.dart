import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(
              'Dicee',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}


class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftNum = 1;
  int rightNum = 1;
  Map<String,int> numsR = {};

  void randomFaces() {
    setState(() {  //setState update the stare recall the build
      leftNum = Random().nextInt(6) + 1;
      rightNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            //flex:1,
              child: TextButton(
                  onPressed:(){
                    randomFaces();
                  },
                  child: Image.asset('images/dice$leftNum.png')
              )
          ),
          //Expanded must be DIRECT child of Column/Row/Flex!!otherwise error
          Expanded(
            //flex:1,
              child: TextButton(
                onPressed:(){
                  randomFaces();
                },
                child: Image(
                  image: AssetImage('images/dice$rightNum.png'),  //Short method
                ),
              )
          ),
        ],
      ),
    );
  }
}

Map<String,int> getRandomsNums(leftNum,rightNum){
  int leftNum= Random().nextInt(6)+1;
  int rightNum= Random().nextInt(6)+1;
  return {'leftNum':leftNum, 'rightNum':rightNum};
}
