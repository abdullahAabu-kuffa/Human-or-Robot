// ignore_for_file: prefer_final_fields

import 'question.dart';

class AppBrain {
  // ignore: unused_field
  int _questionNumber = 0;
  List<Question> _questionGroup = [
    Question('The number of planets in the solar system is eight planets.',
        'images/image-1.jpg', true),
    Question('cats eat animals.', 'images/image-2.jpg', false),
    Question('China in Africa.', 'images/image-3.jpg', false),
    Question('The Earth is flat, not spherical.', 'images/image-4.jpg', false),
    Question(
        'Man can survive without eating meat.', 'images/image-3.jpg', true),
    Question(
        'The sun revolves around the earth and the earth revolves around the moon.',
        'images/image-3.jpg',
        false),
    Question('Animals do not feel pain.', 'images/image-3.jpg', false),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
