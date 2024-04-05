import 'package:flutter/material.dart';
import 'package:voting_app/main.dart';

class AnsweredQuestion extends StatefulWidget {
  final int questionNumber;
  final List<dynamic> questionInfo; //the name and answer options
  final VoidCallback? onPressed;

  const AnsweredQuestion({
    Key? key,
    required this.questionNumber,
    required this.questionInfo,
    this.onPressed
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnsweredQuestionState();
}

class AnsweredQuestionState extends State<AnsweredQuestion> {
  bool _isShortAnswer() {
    return widget.questionInfo[1].isEmpty;
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
            children: [...List.generate(widget.questionInfo[1].length,
              (index) {
                final double percentChose = (1 / widget.questionInfo[1].length) * 100;
                final testAnswer = testPollsAnswers[currentPoll][widget.questionNumber - 1];

                if (isAdmin) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(padding: const EdgeInsets.only(left: 15), 
                      child: Text('${(double.parse(percentChose.toStringAsFixed(1)))}% of people chose: ', 
                      style: const TextStyle(color: Color(0xFF113143), fontSize: 16))
                    ),
                    Padding(padding: const EdgeInsets.only(top: 6, left: 12, right: 12, bottom: 12), child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEBEBEB),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                      ),
                      child: Text(widget.questionInfo[1][index], style: const TextStyle(color: Color(0xFF113143), fontSize: 18))
                    ))
                  ]);
                } else if (index != testAnswer) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(padding: const EdgeInsets.only(left: 15), 
                      child: Text('${(double.parse(percentChose.toStringAsFixed(1)))}% of people chose: ', 
                      style: const TextStyle(color: Color(0xFF113143), fontSize: 16))
                    ),
                    Padding(padding: const EdgeInsets.only(top: 6, left: 12, right: 12, bottom: 12), child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEBEBEB),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                      ),
                      child: Text(widget.questionInfo[1][index], style: const TextStyle(color: Color(0xFF113143), fontSize: 18))
                    ))
                  ]);
                } else {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(padding: const EdgeInsets.only(left: 15), 
                      child: Text('You and ${(double.parse(percentChose.toStringAsFixed(1)))}% of people chose: ', 
                      style: const TextStyle(color: Color(0xFF113143), fontSize: 16, fontWeight: FontWeight.w600))
                    ),
                    Padding(padding: const EdgeInsets.only(top: 6, left: 12, right: 12, bottom: 12), child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEBEBEB),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                      ),
                      child: Text(widget.questionInfo[1][index], style: const TextStyle(color: Color(0xFF113143), fontSize: 18))
                    ))
                  ]);
                }
              }),
              Visibility(visible: _isShortAnswer() && !isAdmin, child: Padding(padding: const EdgeInsets.only(top: 6, bottom: 12, left: 12, right: 12), child: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  height: 87,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEBEBEB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Padding(padding: const EdgeInsets.all(10), child: SingleChildScrollView(child: Text(
                    testPollsAnswers[currentPoll][widget.questionNumber - 1] is int ? '' : testPollsAnswers[currentPoll][widget.questionNumber - 1],
                    style: const TextStyle(color: Color(0xFF113143))
                  )))
                ))
              )),
              Visibility(visible: _isShortAnswer() && isAdmin, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Padding(padding: EdgeInsets.only(left: 12, bottom: 6), child: Text('User Short Answers:', style: TextStyle(color: Color(0xFF113143), fontSize: 16))),
                SizedBox(height: 170, child: ListView.builder(itemCount: adminTestPollAnswers.length, itemBuilder: (context, index) {
                  return Padding(padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12), child: SingleChildScrollView(
                    child: Container(
                      width: double.maxFinite,
                      height: 87,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFEBEBEB),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Padding(padding: const EdgeInsets.all(10), child: SingleChildScrollView(child: Text(
                        adminTestPollAnswers[index],
                        style: const TextStyle(color: Color(0xFF113143))
                      )))
                    ))
                  );
                })
              )]))
            ]
          )
        ]
      ),
    ));
  }
}