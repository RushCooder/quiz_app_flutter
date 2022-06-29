import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';

class ResultCard extends StatefulWidget {
  final int quesNo;
  List<Map<String, dynamic>> questions;
  ResultCard({required this.questions, required this.quesNo, Key? key})
      : super(key: key);

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.quesNo + 1}. ${widget.questions[widget.quesNo]['question']}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          // Column(
          //   children: (questions[0]['answers'] as List)
          //       .map(
          //         (ans) {
          //           print(ans.notes.indexOf())
          //           return Text(ans.toString());},
          //       )
          //       .toList(),
          // )

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height:
                (widget.questions[widget.quesNo]['answers'] as List).length == 4
                    ? 250
                    : 150,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
                  (widget.questions[widget.quesNo]['answers'] as List).length,
              itemBuilder: (context, index) =>
                  // Text((questions[0]['answers'] as List)[index]),
                  ListTile(
                title: Text((widget.questions[widget.quesNo]['answers']
                    as List)[index]),
                leading: Radio(
                  value: index,
                  groupValue: widget.questions[widget.quesNo]['givenAnswer'],
                  onChanged: (value) {
                    // setState(() {
                    //   questions[widget.quesNo]['givenAnswer'] = value;
                    // });
                    // print(widget.questions[widget.quesNo]['givenAnswer']);
                  },
                ),
              ),
            ),
          ),
          Text(
            'Answer: ${questions[widget.quesNo]['answers'][questions[widget.quesNo]['realAnswer']]}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
