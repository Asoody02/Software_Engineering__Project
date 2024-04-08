import 'package:flutter/material.dart';
import 'package:voting_app/organization_thumbnail.dart';
import 'package:voting_app/poll_thumbnail.dart';
import 'package:postgres/postgres.dart';

class PollThumbnailManager {
  /*The following functions only exist for testing purposes, which is why they're hardcoded in. 
  Feel free though to use them as a base plate for the final functions.*/
  final PostgreSQLConnection _connection = PostgreSQLConnection(
      "localhost",
      5433,
      "postgres",
      username: "postgres",
      password: "link18266",
  );

  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    _connectToDatabase();
  }

  Future<void> _connectToDatabase() async {
    await _connection.open();
    final results = await _connection.query('SELECT * FROM your_table_name');
    setState(() {
      _data = results;
    });
  }
  
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