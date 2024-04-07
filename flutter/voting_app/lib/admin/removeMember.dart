import 'package:flutter/material.dart';

class RemoveMember extends StatefulWidget {
  const RemoveMember({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RemoveMemberState();
}

class RemoveMemberState extends State<RemoveMember> {
  String pollDropdownValue = 'one'; // For poll selection
  String userDropdownValue = 'four'; // For user selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Poll Members'),
      ),
      body: ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
        Text('Select Poll'),
        DropdownButton<String>(
          value: pollDropdownValue,
          icon: const Icon(Icons.menu),
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: (String? newValue) {
            setState(() {
              pollDropdownValue = newValue!;
            });
          },
          items: const [
            DropdownMenuItem<String>(
              value: 'one',
              child: Text('Poll One'),
            ),
            DropdownMenuItem<String>(
              value: 'two',
              child: Text('Poll Two'),
            ),
            DropdownMenuItem<String>(
              value: 'three',
              child: Text('Poll Three'),
            ),
          ],
        ),
        Text('Select User'),
        DropdownButton<String>(
          value: userDropdownValue,
          icon: const Icon(Icons.menu),
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: (String? newValue) {
            setState(() {
              userDropdownValue = newValue!;
            });
          },
          items: const [
            DropdownMenuItem<String>(
              value: 'four',
              child: Text('Person One'),
            ),
            DropdownMenuItem<String>(
              value: 'five',
              child: Text('Person Two'),
            ),
            DropdownMenuItem<String>(
              value: 'six',
              child: Text('Person Three'),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            // Insert logic to remove member here
          },
          child: const Text('Remove Member'),
        ),
      ]),
    );
  }
}