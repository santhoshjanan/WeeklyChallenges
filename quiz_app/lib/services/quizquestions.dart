import 'package:http/http.dart';
import 'dart:convert';

class Answer{
  String answer;
  bool isTrue;

  Answer({String a, bool f}){
    answer = a;
    isTrue = f;

    print(answer);
  }
}
class Question{
  String question;
  List answer;

  Question({String q, List a}){
    question = q;
    answer = a;
  }
}

class QuizQuestions{
  String appName;
  String event;
  List<Question> questions = [];

  Future<void> getQuestions() async {
    try{
      Response response = await get('http://www.mocky.io/v2/5ebd2f5f31000018005b117f');
      Map data = jsonDecode(response.body);
      appName = data["AppName"];
      event = data["event Conducted By"];

      List questionbank = data["Quiz Questions"];
      questionbank.forEach((question){
          Question q = new Question(q: question["Questions"], a: question["Answers"]);
          questions.add(q);
        }
      );
    }catch(e){
      print('Error $e');
    }
  }
}