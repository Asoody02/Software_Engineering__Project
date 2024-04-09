import 'package:flutter/material.dart';
import 'package:voting_app/organization_thumbnail.dart';
import 'package:voting_app/poll_thumbnail.dart';
import 'package:postgres/postgres.dart';

class PollThumbnailManager {
  /*The following functions only exist for testing purposes, which is why they're hardcoded in. 
  Feel free though to use them as a base plate for the final functions.*/
  
final conn = PostgreSQLConnection(
      "localhost",
      5433,
      "postgres",
      username: "postgres",
      password: "link18266",
  );
  await conn.open();
  pollFollowing() async {
    // var results = await conn.query('SELECT pollid, organizationid, polltitle FROM polls');
    return Expanded(
      child: ListView(
        children: const [
          PollThumbnail(
            pollID: await conn.query('SELECT pollid FROM polls'), 
            organizationName: await conn.query('SELECT organizationname FROM polls'),
            pollName: await conn.query('SELECT polltitle FROM polls'), 
            currentStatus: 'Completed'
          ),
          PollThumbnail(
            pollID: await conn.query('SELECT pollid FROM polls'),
            organizationName: await conn.query('SELECT organizationname FROM polls'),
            pollName: await conn.query('SELECT polltitle FROM polls'), 
            currentStatus: 'Completed'
          ),
        ],
      )
    );
  }

  pollHistory() {}

  pollFollowingSearch() {}

  pollBrowseSearch() async {
    return Expanded(
      child: ListView(
        children: const [
          OrganizationThumbnail(
            organizationID: await conn.query('SELECT organizationid FROM organizations'), 
            organizationName: await conn.query('SELECT organizationname FROM organizations'), 
          ),
          OrganizationThumbnail(
            organizationID: await conn.query('SELECT organizationid FROM organizations'), 
            organizationName: await conn.query('SELECT organizationname FROM organizations'), 
          ),
        ],
      ) 
    );
  }
}