import 'package:flutter/material.dart';
import 'package:voting_app/navigation_menu.dart';

class PollResults extends StatefulWidget {
  const PollResults({super.key});

  @override
  State<StatefulWidget> createState() => PollResultsState();
}

class PollResultsState extends State<PollResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: 180,
          child: Container(
            color: const Color(0xFF5AC7F0), 
            child: Column(children: [
              Row(children: [
                SizedBox(
                  height: 57,
                  width: 57,
                  child: Container(
                    color: const Color(0xFF113143),
                    child: const Text('org pic')
                  )
                ),
                const Column(children: [
                  Text('[Organization Name]'),
                  Text('[Poll Name]')
                ]),
                Column(children: [
                  IconButton(
                    onPressed: () => NavigationMenu().goToPage(0), 
                    icon: const Icon(Icons.close)
                  ),
                  IconButton(
                    onPressed: () => NavigationMenu().goToPage(4), 
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
      )
    );
  }
}