import 'dart:convert';

import 'question.dart';
import 'question_repository.dart';
import 'package:http/http.dart' as http;

class RemoteQuestionRepository implements QuestionRepository{
  var _url;
  RemoteQuestionRepository(this._url);

  @override
  Future<Question> fetch() async {
    final response = await http.get(_url);

    if (response.statusCode != 200) {
      throw Exception('An error occurred with the API');
    }

    return Question.fromJson(jsonDecode(response.body));
  }

}