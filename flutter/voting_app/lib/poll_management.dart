import 'package:flutter/material.dart';
import 'package:voting_app/organization_thumbnail.dart';
import 'package:voting_app/poll_thumbnail.dart';
import 'package:voting_app/main.dart';

class PollThumbnailManager {
  /*The following functions only exist for testing purposes, which is why they're hardcoded in. 
  Feel free though to use them as a base plate for the final functions.*/

  pollFollowing() {
    return Expanded(
      child: ListView(
        children: [
          PollThumbnail(poll: debugPolls[0]),
          PollThumbnail(poll: debugPolls[1]),
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