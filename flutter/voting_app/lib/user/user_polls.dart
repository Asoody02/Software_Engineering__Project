import 'package:flutter/material.dart';
import 'package:voting_app/poll_management.dart';

class UserPolls extends StatefulWidget {
  const UserPolls({super.key});

  @override
  State<StatefulWidget> createState() => UserPollsState();
}

class UserPollsState extends State<UserPolls> {
  late List<bool> _selections;

  @override
  void initState() {
    super.initState();
    _selections = List.generate(2, (index) => index == 0);
  }

  void _updateSelection(int index) {
    setState(() {
      _selections = List.generate(2, (i) => i == index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        ToggleButtons(
          isSelected: _selections,
          onPressed: (index) {
            _updateSelection(index);
          },
          children: const [
            Text('Following'),
            Text('History')
          ]
        ),
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