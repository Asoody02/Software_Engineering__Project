import 'package:flutter/material.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:voting_app/organization_info.dart';

class PollThumbnail extends StatefulWidget {
  final int pollID;
  final String organizationName;
  final String pollName;
  final String currentStatus;

  const PollThumbnail({
    Key? key,
    required this.pollID,
    required this.organizationName,
    required this.pollName,
    required this.currentStatus,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PollThumbnailState();
}

class PollThumbnailState extends State<PollThumbnail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationController().navigateToScreen(1), //calls AdminPollAdd()
      child: Container(
        height: 72,
        color: const Color(0xFF5AC7F0),
        child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => const OrganizationInfo(), //calls PollResults()
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
            Text('Status: ${widget.currentStatus}')
          ]),
        ]),
      )
    );
  }
}