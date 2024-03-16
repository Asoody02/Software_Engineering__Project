import 'package:flutter/material.dart';
import 'package:voting_app/admin_polls.dart';
import 'package:voting_app/navigation_menu.dart';

void main() {
  runApp(MaterialApp(
    title: 'Policy Vote',
    initialRoute: '/',
    routes: {
      '/': (context) => const Login(),
      '/adminPolls': (context) => const AdminPolls()
    }
  ));
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: <Widget>[
          const Text('Login'),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username'
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password'
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationMenu()));
            }, 
            child: const Text('Login')
          )
        ]),
      ),
    );
  }
}
