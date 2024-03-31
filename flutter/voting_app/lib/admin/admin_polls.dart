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
          child: const Text(
            'Dirt Digger Inc. Polls', 
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            )
          )
        )
      ),
      body: Column(children: <Widget>[
        const Padding(padding: EdgeInsets.all(12), child: TextField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC7E7F3))),
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search, color: Color(0xFF113143))
          )
        )),
        PollThumbnailManager().pollFollowing()
      ])
    );
  }
}