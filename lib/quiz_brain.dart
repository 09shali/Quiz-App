import 'dart:developer';

import 'package:quiz_page/quiz_model.dart';

class QuizBrain {

  int _index = 0;
 List<QuizModel> questionsAndAnswers = <QuizModel>[
  QuizModel(question: 'Кыргызстанда 8 облуст бар', answer: false),
  QuizModel(question: 'Кыргызстандын борбору Бишкек шаары', answer: true),
  QuizModel(question: 'Кыргызстанда Ыссык-Кол деген район бар', answer: true),
  QuizModel(question: 'Баткен облусу Кыргызстандын тундугундо жайгашкан', answer: false),
  QuizModel(question: 'Ош облусунун борбору Кара-Суу', answer: false),
  QuizModel(question: 'Талас облусунда фасоль себишет', answer: true),
  QuizModel(question: 'Чуй облусу Кыргызстандын 8-чи облусу', answer: false),


 ];
 String getQuestion (){
   if (_index < questionsAndAnswers.length){
   log('getQuestion._index: $_index');
   log('question: ${questionsAndAnswers[_index].question}');
   return questionsAndAnswers [_index].question;
 } else {
      return 'Суроо бутту';
    }
  }

 void getNext (){
   _index++;

   log('_index: $_index');
 }

//  bool getAnswer () {
//    return questionsAndAnswers [_index].answer;
//  }
   bool getAnswer() {
    if (_index <= questionsAndAnswers.length) {
      return questionsAndAnswers[_index].answer;
    }
  }
  
  void reset (){
    _index = 0;
  }

//  static bool getAnswer2() {
//    return false;
//  }
}

final QuizBrain quizBrain = QuizBrain();
