import 'package:flutter/foundation.dart';
import 'ninja_quiz_session.dart';
import 'journeyman_quiz_session.dart';
import 'question.dart';
import 'question_repository.dart';
import 'rookie_quiz_session.dart';
import 'warrior_quiz_session.dart';

import 'remote_question_repository.dart';
import 'local_question_repository.dart';

enum QuizSessionState {
  loading,
  showing,
  error,
  completed,
}
enum QuizSessionType {
  rookie,
  journeyman,
  ninja,
  warrior,
}

class QuizSession with ChangeNotifier {
  QuestionRepository _questionRepository;
  Question _currentQuestion;
  int _totalQuestions;
  int _currentQuestionCount = 0;
  bool _showHint;
  QuizSessionState _state;
  int score = 0; //modify only this var in inheritances

  QuizSession({QuestionRepository questionRepository, @required int totalQuestions}) {
    _state = QuizSessionState.loading;
    _questionRepository = questionRepository;
    _totalQuestions = totalQuestions;
    _showHint = false;
  }

  void nextQuestion() async {
    _currentQuestionCount++;
    _showHint = false;
    try {
      if (_currentQuestionCount > _totalQuestions)
        return endGame();
      else {
        _state = QuizSessionState.loading;
        notifyListeners();
        _currentQuestion = await _questionRepository.fetch();
        _state = QuizSessionState.showing;
      }
    } catch (e) {
      _state = QuizSessionState.error;
      print(e);
    }
    notifyListeners();
  }

  void toggleHint() {
    _showHint = !_showHint;
    notifyListeners();
  }

  bool checkAnswer(String answer) {
    return currentQuestion.isCorrectAnswer(answer);
  }

  void endGame(){
    _state=QuizSessionState.completed;
    notifyListeners();
  }


  factory QuizSession.fromEnum(QuizSessionType type,[bool local = true]){
    var questionRepository = local ? new LocalQuestionRepository() : new RemoteQuestionRepository("http://192.168.1.103:4567/questions/next");
    switch(type){
      case QuizSessionType.rookie:
        return RookieQuizSession(questionRepository: questionRepository);
      case QuizSessionType.journeyman:
        return JourneymanQuizSession(questionRepository: questionRepository);
      case QuizSessionType.ninja:
        return NinjaQuizSession(questionRepository: questionRepository);
      case QuizSessionType.warrior:
        return WarriorQuizSession(questionRepository: questionRepository);
      default:
        return QuizSession(questionRepository: questionRepository, totalQuestions: 10);
    }
  }
  
  QuizSessionState get state => _state;
  bool get showHint => _showHint;
  Question get currentQuestion => _currentQuestion;
  int get totalQuestions => _totalQuestions;
  int get currentQuestionCount => _currentQuestionCount;
}
