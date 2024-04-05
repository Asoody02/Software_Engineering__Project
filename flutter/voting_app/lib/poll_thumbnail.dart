import 'package:flutter/material.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:voting_app/organization_info.dart';
import 'package:voting_app/poll.dart';
import 'package:voting_app/main.dart';
import 'package:voting_app/poll_results.dart';
import 'package:voting_app/user/poll_voting.dart';

class PollThumbnail extends StatefulWidget {
  final Poll poll;

  const PollThumbnail({
    Key? key,
    required this.poll,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PollThumbnailState();
}

class PollThumbnailState extends State<PollThumbnail> {
  _onThumbnailPress() {
    currentPoll = widget.poll.id;

    //navigates to poll results if you're an admin
    if (isAdmin) {NavigationController().navigateToScreen(screen: const PollResults());}
    
    //navigates to poll voting if you're an user and if you haven't voted
    else if (!isAdmin && !widget.poll.haveVoted) {NavigationController().navigateToScreen(screen: PollVoting());}

    //navigates to poll results if you're an user and if you've voted
    else if (!isAdmin && widget.poll.haveVoted) {NavigationController().navigateToScreen(screen: const PollResults());}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 7.5, left: 15, right: 15), child: GestureDetector(
      onTap: () => _onThumbnailPress(),
      child: Container(
        width: 313,
        height: 72,
        decoration: ShapeDecoration(
          color: const Color(0xFFC7E7F3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(children: <Widget>[
          GestureDetector(
            //opens organization info popup when organization profile picture is tapped
            onTap: () => const OrganizationInfo(),
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
                widget.poll.organizationName,
                style: const TextStyle(
                  color: Color(0xFF113143),
                  fontSize: 11,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.poll.name,
                style: const TextStyle(
                  color: Color(0xFF113143),
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                )
              ),
              Text(
                'Status: ${widget.poll.status}',
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