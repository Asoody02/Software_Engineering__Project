// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/admin/admin_navigation_menu.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Policy Vote',
      home: LoginPage()
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text('Login'),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(NavigationMenu());
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
