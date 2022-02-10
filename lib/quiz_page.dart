
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_page/custom_button.dart';
import 'package:quiz_page/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({ Key key }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List <Widget> icons = <Widget> [];

Widget correctIcon = const Padding(
  padding: EdgeInsets.only(right: 8.0),
  child:FaIcon(
  FontAwesomeIcons.check,
  color: Color(0xFF4CAF4F),
  ),
  );
Widget wrongIcon = const Padding(
  padding: EdgeInsets.only(right: 8.0),
  child: FaIcon(
  FontAwesomeIcons.times,
  color: Color(0xFFF44336),
  ),
    );

  // String suroo;

  String suroo = 'Suroo';
  bool isFinished = false;

@override
  void initState (){
  super.initState();
  // icons.add(correctIcon);
  // icons.add(wrongIcon);
  // QuizBrain.getAnswer2();
  // QuizBrain().getAnswer();


  suroo = quizBrain.getQuestion();
}

  userAnswered(bool answer) {
    log('userAnswered.answer ===>$answer');
    bool realAnswer = quizBrain.getAnswer();
    
    log('answer == realAnswer: ${answer == realAnswer}');

    if (answer == realAnswer) {
      icons.add(correctIcon);
    } else {
      icons.add(wrongIcon);
    }

    quizBrain.getNext();
    suroo = quizBrain.getQuestion();

    if (suroo == 'Суроо бутту') {
      isFinished = true;
    }


    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(height: 35.0,), 
                Text(
                 suroo ?? 'suroo',
                 style: const TextStyle(
                color: Colors.white,
                fontSize: 26.0
                ),
                textAlign: TextAlign.center,
                ),

                if (isFinished == true) CustomButton(buttonText: 'bashinan bashta', onPressed: (){
                  quizBrain.reset();
                  suroo = quizBrain.getQuestion();
                  isFinished = false;
                  icons = <Widget>[];
                  setState(() {});
                })
                else
               Column(
                 children: [
                 CustomButton(
                 onPressed: (){
                   userAnswered(true);
                  //  setState(() {
                  //  icons.add(correctIcon);
                  //  quizBrain.getNext();
                  //  suroo = quizBrain. getQuestion();
                  //  });
                 },
                  buttonText: 'Туура',
                  bgColor: const Color(0xFF4CAF4F),
                  ),
               const SizedBox(height: 20.0,),
               CustomButton(
                 onPressed: (){
                   userAnswered(false);
                  //  icons.add(wrongIcon);
                  //  setState(() {
                     
                  //  });
                 },
                  buttonText: 'Туура эмес',
                  bgColor: Color(0xFFF44336),),
                  Row (children: icons,)
               ],
               )
            ],
          ),
        ),
      ),
      
    );
  }
}