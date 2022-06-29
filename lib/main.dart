import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home/home.dart';
import 'package:quiz_app/pages/result/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => const Home(),
        Result.routeName: (context) => const Result(),
      },
    );
  }
}
