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
    Future.delayed(new Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, '/home', arguments: instance.questions);
    });


  }

  @override
  void initState() {
    super.initState();
    setupQuestions();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Image.asset('assets/loader.gif'),
            Text(
                'Quiz App',
                style: TextStyle(
                  fontSize: 32.0
                )
            ),

            Text(
                'loading...',
                style: TextStyle(
                  color: Colors.green[900],
                  fontStyle: FontStyle.italic
                )
            )
          ],
        )
    );
  }
}
