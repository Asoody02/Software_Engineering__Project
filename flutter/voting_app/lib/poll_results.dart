import 'package:flutter/material.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:voting_app/organization_info.dart';

class PollResults extends StatefulWidget {
  const PollResults({super.key});

  @override
  State<StatefulWidget> createState() => PollResultsState();
}

class PollResultsState extends State<PollResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( //if this doesn't work its because the SizedBox wrapping it was deleted
        height: 180,
        color: const Color(0xFF5AC7F0), 
        child: Column(children: [
          Row(children: [
            GestureDetector(
              //opens organization info popup when organization profile picture is tapped
              onTap: () => const OrganizationInfo(),
              child: SizedBox(
                width: 57,
                height: 57,
                child: Container(
                  color: const Color(0xFF113143), 
                  child: const Text('org pic')
                )
              )
            ),
            const Column(children: [
              Text('[Organization Name]'),
              Text('[Poll Name]')
            ]),
            Column(children: [
              IconButton(
                //navigates to first navbar page when close icon is tapped
                onPressed: () => NavigationController().navigateToScreen(0),
                icon: const Icon(Icons.close)
              ),
              IconButton(
                //navigates to poll comments when the comment icon is tapped
                onPressed: () => NavigationController().navigateToScreen(4),
                icon: const Icon(Icons.comment)
              )
            ])
          ]),
          SizedBox(
            height: 87,
            width: 336,
            child: Container(
              color: const Color(0xFFC7E7F3),
              child: const Text('poll description')
            )
          )
        ]),
      )
    );
  }
}