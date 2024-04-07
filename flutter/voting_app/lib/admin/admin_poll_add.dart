// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:voting_app/admin/poll_add_widgets/admin_question_edit.dart';
import 'package:voting_app/confirmation_alert.dart';
import 'package:voting_app/navigation_menu.dart';

class AdminPollAdd extends StatefulWidget {
  AdminPollAdd({super.key});

  @override
  State<StatefulWidget> createState() => AdminPollAddState();
}

class AdminPollAddState extends State<AdminPollAdd> {
  int questionNumber = 2;
  final List<Widget> _pollQuestions = [
    const Padding(padding: EdgeInsets.only(top: 12), child: QuestionEdit(questionNumber: 1, onPressed: null,))
  ];

  //adds a question to the _pollQuestions list and refreshes the page
  void _addQuestion() {
    final key = UniqueKey();
    setState(() {
      _pollQuestions.add(
        Padding(key: key, padding: const EdgeInsets.only(top: 12), child: QuestionEdit(questionNumber: questionNumber++, onPressed: () {
          setState(() {
            questionNumber--;
            _pollQuestions.removeWhere((widget) => widget.key == key);
          });
        }))
      );
    });
  }

  //shows a confirmation alert
  void _confirmationAlert(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) {
        return const CustomAlertDialog(
          title: 'Upload Confirmation',
          content: 'Are you sure you want to upload? The poll cannot be edited once uploaded!',
        );
      },
    ).then((value) {
      /*if user taps the cancel button or taps off the popup then its closed and nothing else happens. if the user taps 
      the confirm button, the app navigates to admin polls page and shows a popup saying the uploading was successful*/
      if (value != null && value) {
        NavigationController().navigateToScreen(0);
        showDialog(context: context, builder: (BuildContext context) {
          return SimpleDialog(
            title: Container(
              padding: const EdgeInsets.only(bottom: 20), 
              alignment: Alignment.center, 
              child: const Text('Poll Successfully Uploaded!', style: TextStyle(
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
String pollName = ''; // Variable to store poll name
String pollDescription = ''; // Variable to store poll description
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
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dirt Diggin Inc.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 336, child: TextField(
                    onChanged: (value) {
                            pollName = value;
                          },
                    decoration: InputDecoration(
                      hintText: 'Enter poll name...',
                      prefixIcon: Icon(Icons.edit, color: Color(0xFF113143),)
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ))
                ]
              ),
            ]),
            Padding(padding: const EdgeInsets.all(12), child: Container(
              width: double.maxFinite,
              height: 87,
              decoration: ShapeDecoration(
                color: const Color(0xFFC7E7F3),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child:  Padding(
                padding: EdgeInsets.only(left: 10, right: 10), 
                child: TextField(
                  onChanged: (value) {
                        pollDescription = value;
                      },
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter poll description...',
                  ),
                  style: TextStyle(color: Color(0xFF113143))
                )
              )
            ))
          ]),
        )
      ),
      Expanded(child: ListView(children: [
        ..._pollQuestions, 
        Padding(padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12), child: TextButton(
          onPressed: _addQuestion, 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
          ),
          child: const Text('Add Question', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))
        )),
        Padding(padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12), child: TextButton(
          onPressed: () => _confirmationAlert(context), 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF113143)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
          ),
          child: const Text('Upload Poll', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))
        )),
      ])),
    ]);
  }
}