import 'package:flutter/material.dart';
import 'package:voting_app/organization_thumbnail.dart';
import 'package:voting_app/poll_thumbnail.dart';

class PollThumbnailManager {
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

    pollHistory() {
    return Expanded(
      child: ListView(
        children: const [
          PollThumbnail(
            pollID: 0, 
            organizationName: 'Dirt Digger Inc.', 
            pollName: 'Where Can We **LEGALLY** Dig Dirt?', 
            currentStatus: 'Ongoing'
          ),
          PollThumbnail(
            pollID: 0, 
            organizationName: 'Dirt Digger Inc.', 
            pollName: 'Is Dirt Digging Worth the Pay?', 
            currentStatus: 'Completed'
          ),
        ],
      )
    );
  }

    pollFollowingSearch() {
    return Expanded(
      child: ListView(
        children: const [
          OrganizationThumbnail(
            organizationID: 0, 
            organizationName: 'Mud Making Guild', 
          ),
          OrganizationThumbnail(
            organizationID: 0, 
            organizationName: 'Dirt Digger Inc.', 
          ),
        ],
      )
    );
  }

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