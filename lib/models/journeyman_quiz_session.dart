import 'question_repository.dart';

import 'quiz_session.dart';

class JourneymanQuizSession extends QuizSession {
  JourneymanQuizSession({QuestionRepository questionRepository, int totalQuestions = 10}): super(questionRepository: questionRepository, totalQuestions: totalQuestions);
  bool checkAnswer(String answer) {
    if (super.checkAnswer(answer))
    {
      score++;
      return true;
    }
    score--;
    return false;
  }
}