import 'package:flutter/material.dart';
import 'package:voting_app/poll_management.dart';

class UserSearch extends StatefulWidget {
  const UserSearch({super.key});

  @override
  State<StatefulWidget> createState() => UserSearchState();
}

class UserSearchState extends State<UserSearch> {
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
            Text('Browse')
          ]
        ),
        const TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Poll Code...',
              suffixIcon: Icon(Icons.add)
          )
        ),
        PollThumbnailManager().pollFollowing()
      ])
    );
  }
}