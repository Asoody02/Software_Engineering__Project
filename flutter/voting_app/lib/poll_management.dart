import 'package:flutter/material.dart';
import 'package:voting_app/organization_thumbnail.dart';
import 'package:voting_app/poll_thumbnail.dart';
import 'package:voting_app/poll_service.dart';

class PollThumbnailManager {
   late Future<List<dynamic>> polls;
  /*The following functions only exist for testing purposes, which is why they're hardcoded in. 
  Feel free though to use them as a base plate for the final functions.*/

  pollFollowing() {
    return Expanded(
      child: ListView(
        children: const [
          PollThumbnail(
            pollID: 0, 
            organizationName: 'Dirt Digger Inc.', 
            pollName: 'How Much Dirt to Dig?', 
            currentStatus: 'Ongoing'
          ),
          PollThumbnail(
            pollID: 0, 
            organizationName: 'Dirt Digger Inc.', 
            pollName: 'When Should We Dig Dirt?', 
            currentStatus: 'Completed'
          ),
        ],
      )
    );
  }

  pollHistory() {}

  pollFollowingSearch() {}

  pollBrowseSearch() {
    return Expanded(
      child: ListView(
        children: const [
          OrganizationThumbnail(
            organizationID: 0, 
            organizationName: 'Jolly Bean Joy Co.', 
          ),
          OrganizationThumbnail(
            organizationID: 0, 
            organizationName: 'Chocobo Wranglers LLC', 
          ),
        ],
      ) 
    );
  }
}