import 'package:flutter/material.dart';
import 'package:quizapp/ui/loading.dart';
import 'package:quizapp/ui/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home()
  },
));