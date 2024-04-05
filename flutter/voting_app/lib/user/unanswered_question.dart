import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  final int questionNumber;
  final List<dynamic> questionInfo; //the name and answer options
  final VoidCallback? onPressed;

  const Question({
    Key? key,
    required this.questionNumber,
    required this.questionInfo,
    this.onPressed
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => QuestionState();
}

class QuestionState extends State<Question> {
  bool _isShortAnswer() {
    return widget.questionInfo[1].isEmpty ? true : false;
  }

  int? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Padding(key: widget.key, padding: const EdgeInsets.only(top: 12, left: 12, right: 12), child: Container(
      width: 313,
      decoration: ShapeDecoration(
        color: const Color(0xFFC7E7F3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Padding(padding: const EdgeInsets.only(top: 12, left: 12, right: 12), child: Text(
            'Question ${widget.questionNumber}',
            style: const TextStyle(
              color: Color(0xFF113143),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            )
          )),
          Padding(padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12), child: Text(
            widget.questionInfo[0],
            style: const TextStyle(
              color: Color(0xFF113143),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            )
          )),
          Column(
            children: [...List.generate(
              widget.questionInfo[1].length,
              (index) {
                return Padding(padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12), child: Material(
                  borderRadius: BorderRadius.circular(8),
                  child: RadioListTile<int>(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    tileColor: const Color(0xFFEBEBEB),
                    fillColor: const MaterialStatePropertyAll(Color(0xFF5AC7F0)),
                    title: Text(widget.questionInfo[1][index], style: const TextStyle(color: Color(0xFF113143))),
                    value: index,
                    groupValue: selectedOption,
                    onChanged: (value) => setState(() => selectedOption = value),
                  )
                ));
              }
              ),
              Visibility(visible: _isShortAnswer(), child: Padding(padding: const EdgeInsets.only(top: 6, bottom: 12, left: 12, right: 12), child: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  height: 87,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEBEBEB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10), 
                    child: TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter answer...',
                      ),
                      style: TextStyle(color: Color(0xFF113143))
                    )
                  )
                ))
              ))
            ]
          )
        ]
      ),
    ));
  }
}