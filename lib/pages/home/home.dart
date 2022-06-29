import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/pages/home/components/question_card.dart';
import 'package:quiz_app/pages/result/result.dart';

class Home extends StatefulWidget {
  static const String routeName = '/';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzz'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) => QuestionCard(
                  questions: questions,
                  quesNo: index,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Result.routeName, arguments: questions);
                },
                child: const Text('Submit'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
