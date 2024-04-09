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
        DropdownButtonFormField(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
            contentPadding:
              EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          ),
          value: pollDropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          style: const TextStyle(color: Colors.black),
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
        DropdownButtonFormField(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
            contentPadding:
              EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.0),
            )),

          value: userDropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          style: const TextStyle(color: Colors.black),
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
        SizedBox(
          height: 20,
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