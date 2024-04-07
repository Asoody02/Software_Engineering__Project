import 'package:flutter/material.dart';
import 'package:voting_app/user/unanswered_question.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:voting_app/main.dart';

class PollResults extends StatefulWidget {
  const PollResults({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PollResultsState();
}

class PollResultsState extends State<PollResults> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: Container(
            color: const Color(0xFF5AC7F0),
            padding: EdgeInsets.only(top: 20, bottom: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 12, right: 12),
                      child: Container(
                        width: 57,
                        height: 57,
                        decoration: const BoxDecoration(
                          color: Color(0xFF113143),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Center(
                          child: Text(
                            'org\npic',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Dirt Diggin Inc.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: double.maxFinite,
                    height: 87,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFC7E7F3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Text(
                          debugPolls[currentPoll].description,
                          style: const TextStyle(color: Color(0xFF113143)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
       Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: debugPolls[currentPoll].questions.length,
                itemBuilder: (context, index) {
                  return Question(questionNumber: index + 1, questionInfo: debugPolls[currentPoll].questions[index]);
                },
              ),
              ElevatedButton(
                onPressed: () {
                // Add your onPressed logic here
                },
                child: Text('Submit Poll'),
              ),
           ],
        ),
      ),
    ),

      ],
    );
  }
}