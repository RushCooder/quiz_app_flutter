import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final int quesNo;
  final List<Map<String, dynamic>> questions;
  const QuestionCard({required this.questions, required this.quesNo, Key? key}) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: (widget.questions[widget.quesNo]['answers'] as List).length == 4
              ? 250
              : 150,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: (widget.questions[widget.quesNo]['answers'] as List).length,
            itemBuilder: (context, index) =>
                // Text((questions[0]['answers'] as List)[index]),
                ListTile(
              title:
                  Text((widget.questions[widget.quesNo]['answers'] as List)[index]),
              leading: Radio(
                value: index,
                groupValue: widget.questions[widget.quesNo]['givenAnswer'],
                onChanged: (value) {
                  setState(() {
                    widget.questions[widget.quesNo]['givenAnswer'] = value;
                  });
                  // print(widget.questions[widget.quesNo]['givenAnswer']);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
