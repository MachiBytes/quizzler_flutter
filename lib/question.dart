import 'package:flutter/material.dart';

class Question {
  String questionText;
  bool questionAnswer;

  Question(this.questionText, this.questionAnswer);

  Icon verifyAnswer(bool answer) {
    if (answer == questionAnswer) {
      return Icon(Icons.check, color: Colors.green,);
    } else {
      return Icon(Icons.close, color: Colors.red,);
    }
  }
}