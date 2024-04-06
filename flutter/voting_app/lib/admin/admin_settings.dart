import 'package:flutter/material.dart';
import 'package:voting_app/admin/removeMember.dart';
import 'package:voting_app/main.dart';

class AdminSettings extends StatefulWidget {
  const AdminSettings({super.key});

  @override
  State<StatefulWidget> createState() => UserSettingsState();
}

class UserSettingsState extends State<AdminSettings> {
  bool _notificationEnabled = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text('Notifications'),
          SwitchListTile(
            title: Text('Enable  Notifications'),
            value: _notificationEnabled,
            onChanged: (value) {
              setState(() {
                _notificationEnabled = value;
              });
            },
          ),
          Text('Account'),
            ListTile(
            title: const Text('Change Password'),
            tileColor: Colors.white,
            shape: Border(
              top: BorderSide(
                color: const Color(0xFF113143),
                width: 1,
              ),
              bottom: BorderSide(
                color: const Color(0xFF113143),
                width: 1,
              ),
            ),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RemoveMember()),
              );
            },
            trailing: Icon(Icons.arrow_right_outlined),
          ),
          const SizedBox(height: 10),
          Text('Manage Polls'),
            ListTile(
            title: const Text('Manage Poll Members'),
            tileColor: Colors.white,
            shape: Border(
              top: BorderSide(
                color: const Color(0xFF113143),
                width: 1,
              ),
              bottom: BorderSide(
                color: const Color(0xFF113143),
                width: 1,
              ),
            ),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RemoveMember()),
              );
            },
            trailing: Icon(Icons.arrow_right_outlined),
          ),
          const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Insert logic to log out
            MaterialPageRoute(builder: (context) => Login());
          },
          style: ElevatedButton.styleFrom (
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF5AC7F0),
            ),
          child: const Text('Log Out'),
        ),
        ],
      ),
    );
  }
  }
