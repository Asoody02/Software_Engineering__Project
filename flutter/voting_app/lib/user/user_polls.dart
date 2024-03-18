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
        Padding(padding: const EdgeInsets.only(top: 15), child: Container( 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFEBEBEB)
          ),
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF757575),
            selectedColor: const Color(0xFFFFFFFF),
            fillColor: const Color(0xFF5AC7F0),
            isSelected: _selections,
            onPressed: (index) {
              _updateSelection(index);
            },
            children: const [
              Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text(
                'Following',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                )
              )),
              Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text(
                'History',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                )
              ))
            ]
          )
        )),
        const Padding(padding: EdgeInsets.all(7.5), child: TextField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC7E7F3))),
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search, color: Color(0xFF113143),)
          )
        )),
        const Padding(padding: EdgeInsets.all(7.5), child: TextField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC7E7F3))),
              hintText: 'Enter Poll Code...',
              suffixIcon: Icon(Icons.add, color: Color(0xFF113143))
          )
        )),
        PollThumbnailManager().pollFollowing()
      ])
    );
  }
}