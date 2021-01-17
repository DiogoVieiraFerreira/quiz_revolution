import 'dart:async';

import 'quiz_session.dart';
import 'question_repository.dart';
import 'warrior_quiz_session.dart';

class NinjaQuizSession extends WarriorQuizSession {
  Timer timer;

  NinjaQuizSession({QuestionRepository questionRepository}): super(questionRepository: questionRepository) {
    questionTimeout();
  }

  void nextQuestion() {
    if (state == QuizSessionState.completed)
      timer.cancel();

    super.nextQuestion();
    questionTimeout();
  }
  questionTimeout([int seconds = 3]) {
    if (timer != null) timer.cancel();
    timer = Timer(Duration(seconds: seconds), nextQuestion);
  }
}
