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
          PollThumbnail(poll: testPolls[0]),
          PollThumbnail(poll: testPolls[1]),
        ],
      )
    );
  }

  pollHistory() {}

  organizationFollowingSearch() {}

  organizationBrowseSearch() {
    return Expanded(
      child: ListView(
        children: [
          OrganizationThumbnail( organization: testOrganizations[0]),
          OrganizationThumbnail( organization: testOrganizations[1]),
        ],
      ) 
    );
  }
}