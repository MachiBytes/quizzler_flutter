import 'package:flutter/material.dart';
import 'question.dart';

class QuizBrain {
  final List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
      'No piece of square dry paper can be folded in half more than 7 times.',
      false,
    ),
    Question(
      'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      true,
    ),
    Question(
      'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      false,
    ),
    Question(
      'The total surface area of two human lungs is approximately 70 square metres.',
      true,
    ),
    Question('Google was originally called \"Backrub\".', true),
    Question(
      'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      true,
    ),
    Question(
      'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      true,
    ),
  ];
  List<Icon> _scoreKeeper = [];
  int _currentQuestionIndex = 0;

  String getQuestion() {
    if (_currentQuestionIndex > _questionBank.length - 1) {return '';}
    return _questionBank[_currentQuestionIndex].questionText;
  }

  void submitAnswer(bool answer) {
    Icon icon = _questionBank[_currentQuestionIndex].verifyAnswer(answer);
    if (_currentQuestionIndex < _questionBank.length) {
      _scoreKeeper.add(icon);
    }
    nextQuestion();
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questionBank.length) {
      _currentQuestionIndex++;
    }
  }

  List<Icon> getScores() {
    return _scoreKeeper;
  }

  int getScore() {
    int score = 0;
    for (Icon icon in _scoreKeeper) {
      if (icon.icon == Icons.check) {score++;}
    }
    return score;
  }

  bool isFinished() {
    return _currentQuestionIndex == _questionBank.length;
  }

  void restart() {
    _currentQuestionIndex = 0;
    _scoreKeeper = [];
  }
}
