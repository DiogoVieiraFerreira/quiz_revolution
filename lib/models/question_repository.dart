import 'question.dart';

abstract class QuestionRepository{
  Future<Question> fetch();
}