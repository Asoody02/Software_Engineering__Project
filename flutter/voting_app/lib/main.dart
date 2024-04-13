// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/navigation_menu.dart';

late bool isAdmin;

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
              isAdmin = false;
              Get.to(const NavigationMenu());
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              isAdmin = true;
              Get.to(const NavigationMenu());
            }, 
            child: const Text('Admin Login')
          ),
          TextButton(
            onPressed: () {
              isAdmin = false;
              Get.to(const NavigationMenu());
            },
            child: const Text('User Login'),
          )
        ],
      ),
    );
  }
}
