import 'package:flutter/material.dart';
import 'package:quizapp/services/quizquestions.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String loading = 'loading...';

  void setupQuestions() async{
    QuizQuestions instance = QuizQuestions();
    await instance.getQuestions();

    Navigator.pushReplacementNamed(context, '/home', arguments: instance.questions);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupQuestions();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset('assets/loader.gif')
        )
    );
  }
}
