import 'question.dart';

class QuizController {
  int _questionNumber = 0;
  List<Question> _questions = [
    Question(
        question:
            'The Big Apple is a nickname given to washington D.D in 1971 ? ',
        answer: false),
    Question(
      question: 'Peanuts are not nuts!',
      answer: true,
    ),
    Question(
      question: 'People may sneeze or cough while sleeping deeply',
      answer: false,
    ),
    Question(
      question: 'There is no Snow on Minecraft',
      answer: false,
    ),
    Question(
      question: 'The Mona Liza was stolen from the london in 1911',
      answer: true,
    ),
    Question(
      question:
          'Fruit flies were the First Living Creatures sent into the sapce?',
      answer: true,
    ),
    Question(
        question:
            'Friends star Lisa Kudrow was originally cast in the sitcom Frasier',
        answer: true),
    Question(
        question:
            'If you’re born between May 1st and 20th, then you’re a Gemini',
        answer: false),
    Question(
        question:
            'Cyclones spin in a clockwise direction in the southern hemisphere',
        answer: true),
    Question(
        question:
            'Brazil is the only country in the Americas to have the official language of Portuguese',
        answer: true),
    Question(question: 'A woman has walked on the moon', answer: false),
    Question(
        question:
            'Japan and Russia did not sign a peace treaty after World War Two so are technically still at war',
        answer: true),
    Question(
        question:
            'The mathematical name for the shape of a Pringle is hyperbolic paraboloid',
        answer: true),
    Question(
        question:
            'Darth Vader famously says the line “Luke, I am your father” in The Empire Strikes Back',
        answer: false),
    Question(
        question:
            'Olivia Newton-John represented the UK in the Eurovision Song Contest in 1974, the year ABBA won with “Waterloo”',
        answer: true),
    Question(
        question:
            ' Newton-John represented the UK in the Eurovision Song Contest in 1974, the year ABBA won with “Waterloo”',
        answer: false)
  ];

  String get getQuestion => _questions[_questionNumber].question as String;
  bool? get getCorrectAnswer => _questions[_questionNumber].answer;

  //helsp to move to next question
  void nextQuestion() {
    //in oder to check whether we are at the end of the question
    // ignore: empty_statements
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  bool isEnded() {
    if (_questionNumber == _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() => _questionNumber = 0;
}
