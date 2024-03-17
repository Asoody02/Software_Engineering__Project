import 'package:flutter/material.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:voting_app/organization_info.dart';

class OrganizationThumbnail extends StatefulWidget {
  final int organizationID;
  final String organizationName;

  const OrganizationThumbnail({
    Key? key,
    required this.organizationID,
    required this.organizationName,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => OrganizationThumbnailState();
}

class OrganizationThumbnailState extends State<OrganizationThumbnail> {
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
          Text(widget.organizationName),
        ]),
      )
    );
  }
}