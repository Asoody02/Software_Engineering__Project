import 'package:flutter/material.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:voting_app/organization_info.dart';
class PollComments extends StatefulWidget {
  const PollComments({super.key});

  @override
  State<StatefulWidget> createState() => PollCommentsState();
}

class PollCommentsState extends State<PollComments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: 180,
          child: Container(
            color: const Color(0xFF5AC7F0), 
            child: Column(children: [
              Row(children: [
                GestureDetector(
                  onTap: () => OrganizationInfo(), //calls PollResults()
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
                const Column(children: [
                  Text('[Organization Name]'),
                  Text('[Poll Name]')
                ]),
                Column(children: [
                  IconButton(
                    onPressed: () => NavigationController().navigateToScreen(0), //calls AdminPolls()
                    icon: const Icon(Icons.close)
                  ),
                  IconButton(
                    onPressed: () => NavigationController().navigateToScreen(3), //calls PollResults()
                    icon: const Icon(Icons.bar_chart)
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
      )
    );
  }
}