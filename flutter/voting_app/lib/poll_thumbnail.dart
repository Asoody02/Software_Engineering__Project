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
    return Padding(padding: const EdgeInsets.only(top: 7.5, left: 7.5, right: 7.5), child: GestureDetector(
      onTap: () => NavigationController().navigateToScreen(0), //calls AdminPollAdd()
      child: Container(
        width: 313,
        height: 72,
        decoration: ShapeDecoration(
          color: const Color(0xFFC7E7F3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(children: <Widget>[
          GestureDetector(
            onTap: () => const OrganizationInfo(), //calls PollResults()
            child: Padding(padding: const EdgeInsets.all(7.5), child: Container(
              width: 57,
              height: 57,
              decoration: const BoxDecoration(
                color:  Color(0xFF113143), 
                borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: const Center(child: Text('org\npic', style: TextStyle(color: Colors.white)))
            ))
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(
                widget.organizationName,
                style: const TextStyle(
                  color: Color(0xFF113143),
                  fontSize: 11,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.pollName,
                style: const TextStyle(
                  color: Color(0xFF113143),
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                )
              ),
              Text(
                'Status: ${widget.currentStatus}',
                style: const TextStyle(
                  color: Color(0xFF113143),
                  fontSize: 11,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                )
              )
           ]
          ),
        ]),
      )
    ));
  }
}