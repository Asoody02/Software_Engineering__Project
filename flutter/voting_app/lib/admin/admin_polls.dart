import 'package:flutter/material.dart';
import 'package:voting_app/poll_management.dart';

class AdminPolls extends StatefulWidget {
  const AdminPolls({super.key});

  @override
  State<StatefulWidget> createState() => AdminPollsState();
}

class AdminPollsState extends State<AdminPolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF5AC7F0),
        centerTitle: true,
        title: Title(
          color: Colors.white,
          child: const Text('[Organization Name] Polls')
        )
      ),
      body:  Column(children: <Widget>[
        const TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search)
          )
        ),
        PollThumbnailManager().pollFollowing()
      ])
    );
  }
}