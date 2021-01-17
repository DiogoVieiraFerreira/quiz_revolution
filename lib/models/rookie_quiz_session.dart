import 'question_repository.dart';

import 'quiz_session.dart';

class RookieQuizSession extends QuizSession {
  RookieQuizSession({QuestionRepository questionRepository}): super(questionRepository: questionRepository, totalQuestions: 10);

  bool checkAnswer(String answer) {
    if(currentQuestion.isCorrectAnswer(answer))
    {
      score++;
    }
    return true;
  }
}