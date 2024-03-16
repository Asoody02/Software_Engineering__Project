import 'package:flutter/material.dart';
import 'package:voting_app/navigation_menu.dart';

class PollWidget extends StatefulWidget {
  final int pollID;
  final String organizationName;
  final String pollName;
  final String currentStatus;

  const PollWidget({
    Key? key,
    required this.pollID,
    required this.organizationName,
    required this.pollName,
    required this.currentStatus,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PollWidgetState();
}

class PollWidgetState extends State<PollWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      color: const Color(0xFF5AC7F0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => NavigationMenu().goToPage(2),
            child: SizedBox(
              width: 57,
              height: 57,
              child: Container(
                color: const Color(0xFF113143), 
                child: const Text('org pic')
              )
            )
          ),
          Column(children: [
              Text(widget.organizationName),
              Text(widget.pollName),
              Text(widget.currentStatus)
          ]),
          IconButton(
            onPressed:() => NavigationMenu().goToPage(4),
            icon: const Icon(Icons.comment)
          )
        ]),
    );
  }
}