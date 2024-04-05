import 'package:flutter/material.dart';
import 'package:voting_app/user/unanswered_question.dart';
import 'package:voting_app/confirmation_alert.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:voting_app/main.dart';

class PollVoting extends StatefulWidget {
  const PollVoting({super.key});

  @override
  State<StatefulWidget> createState() => PollVotingState();
}

class PollVotingState extends State<PollVoting> {
  //shows a confirmation alert
  void _confirmationAlert(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) {
        return const CustomAlertDialog(
          title: 'Submission Confirmation',
          content: 'Are you sure you want to submit? Your answers cannot be edited once uploaded!',
        );
      },
    ).then((value) {
      /*if user taps the cancel button or taps off the popup then its closed and nothing else happens. if the user taps 
      the confirm button, the app navigates to poll results and shows a popup saying the submission was successful*/
      if (value != null && value) {
        testPolls[currentPoll].haveVoted = true;
        NavigationController().navigateToScreen(navbarIndex: 0);
        showDialog(context: context, builder: (BuildContext context) {
          return SimpleDialog(
            title: Container(
              padding: const EdgeInsets.only(bottom: 20), 
              alignment: Alignment.center, 
              child: const Text('Poll Successfully Submitted!', style: TextStyle(
                color: Color(0xFF113143),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              )
            ))
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [ 
      SizedBox(
        height: 192,
        child: Container(
          color: const Color(0xFF5AC7F0), 
          child: Column(children: [
            Row(children: [
              Padding(padding: const EdgeInsets.all(12), child: Container(
                width: 57,
                height: 57,
                decoration: const BoxDecoration(
                  color:  Color(0xFF113143), 
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: const Center(child: Text('org\npic', style: TextStyle(color: Colors.white)))
              )),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(
                    testPolls[currentPoll].organizationName, 
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    testPolls[currentPoll].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ]
              )),
              Padding(padding: const EdgeInsets.only(right: 12), child: IconButton(
                //navigates to first navbar screen when close icon is tapped
                onPressed: () => NavigationController().navigateToScreen(navbarIndex: 0),
                icon: const Icon(Icons.close, color: Color(0xFF113143))
              ))
            ]),
            Padding(padding: const EdgeInsets.all(12), child: Container(
              width: double.maxFinite,
              height: 87,
              decoration: ShapeDecoration(
                color: const Color(0xFFC7E7F3),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Padding(padding: const EdgeInsets.all(12), child: SingleChildScrollView(child: Text(
                testPolls[currentPoll].description,
                style: const TextStyle(color: Color(0xFF113143))
              ))))
            )
          ]),
        )
      ),
      Expanded(child: ListView.builder(
          itemCount: testPolls[currentPoll].questions.length + 1,
          itemBuilder: (context, index) {
            if (index < testPolls[currentPoll].questions.length) {
              return UnansweredQuestion(questionNumber: index + 1, questionInfo: testPolls[currentPoll].questions[index]);
            } else {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: TextButton(
                  onPressed: () => _confirmationAlert(context), 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF113143)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                  ),
                  child: const Text('Submit Poll', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))
                ),
              );
            }
          },
      ))
    ]);
  }
}