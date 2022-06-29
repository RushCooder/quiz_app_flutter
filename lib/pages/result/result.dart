import 'package:flutter/material.dart';
import 'package:quiz_app/pages/result/components/result_card.dart';

class Result extends StatefulWidget {
  static const String routeName = '/result';

  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late int marks;
  late List<Map<String, dynamic>> questions;
  bool isPreview = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: isPreview
          ? ResultPreview(questions: questions)
          : Center(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Your score',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        '$marks',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15,),
                      ElevatedButton(
                        onPressed: setPreview,
                        child: Text('Result Preview'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void setPreview() {
    setState(() {
      isPreview = !isPreview;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  int resultCount() {
    int result = 0;
    for (Map<String, dynamic> question in questions) {
      if (question['realAnswer'] == question['givenAnswer']) {
        result++;
      }
    }
    return result;
  }

  @override
  void didChangeDependencies() {
    questions = ModalRoute.of(context)?.settings.arguments
        as List<Map<String, dynamic>>;
    marks = resultCount();
    super.didChangeDependencies();
  }
}

class ResultPreview extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  const ResultPreview({
    required this.questions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) => ResultCard(
                questions: questions,
                quesNo: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
