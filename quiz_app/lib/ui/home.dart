import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Icon> scoreKeeper = [];
  int correct = 0;

  void checkAnswer(bool userChoice){
    setState(() {
      if(userChoice){
        correct++;
        scoreKeeper.add(
            Icon(
                Icons.check,
                color: Colors.green
            )
        );
      }else{
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red
          )
        );
      }
      if(questions.length > qNum+1) {
        qNum++;
      }else{
        var alertStyle = AlertStyle(
            animationType: AnimationType.fromBottom,

            isOverlayTapDismiss: false,
            descStyle: TextStyle(fontWeight: FontWeight.bold),
            animationDuration: Duration(milliseconds: 400),

        );
        Alert(
            context: context,
            title: "Quiz App",
            desc: "You got $correct correct answers out of ${questions.length} questions!!",
            style: alertStyle,
            buttons: [
              DialogButton(
                child: Text(
                  "Restart Quiz",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  //Reset stats
                  qNum=0;
                  scoreKeeper.clear();
                  correct =0;

                  Navigator.pop(context);
                  },
                width: 120,
              ),
              DialogButton(
                child: Text(
                  "Exit Quiz",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
                width: 120,
              )
            ],)
            .show();
        qNum=0;
        scoreKeeper.clear();
        correct =0;
      }
    });
  }
  int qNum = 0;
  List questions = [];

  @override
  Widget build(BuildContext context) {
    questions = ModalRoute.of(context).settings.arguments;
    String currentQuestion = questions[qNum].question;
    String answer1 = questions[qNum].answer[0]["Answers"];
    String answer2 = questions[qNum].answer[1]["Answers"];
    String answer3 = questions[qNum].answer[2]["Answers"];
    String answer4 = questions[qNum].answer[3]["Answers"];

    bool bAnswer1 = questions[qNum].answer[0]["isTrue"];
    bool bAnswer2 = questions[qNum].answer[1]["isTrue"];
    bool bAnswer3 = questions[qNum].answer[2]["isTrue"];
    bool bAnswer4 = questions[qNum].answer[3]["isTrue"];
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  currentQuestion,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.green[900]
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text(
                    answer1,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    ),
                  ),
                  onPressed: (){
                    checkAnswer(bAnswer1);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text(
                    answer2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    ),
                  ),
                  onPressed: (){
                    checkAnswer(bAnswer2);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text(
                    answer3,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    ),
                  ),
                  onPressed: (){
                    checkAnswer(bAnswer3);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text(
                    answer4,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    ),
                  ),
                  onPressed: (){
                    checkAnswer(bAnswer4);
                  },
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        )
    );
  }
}
