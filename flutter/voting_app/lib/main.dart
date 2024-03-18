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
          const Padding(padding: EdgeInsets.symmetric(vertical: 15), child: Text(
            'Policy Vote Login',
            style: TextStyle(
              color: Color(0xFF5AC7F0),
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            )
          )),
          const Padding(padding: EdgeInsets.all(7.5), child: TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC7E7F3))),
                hintText: 'Username',
            )
          )),
          const Padding(padding: EdgeInsets.all(7.5), child: TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC7E7F3))),
                hintText: 'Password',
            )
          )),
          Padding(padding: const EdgeInsets.only(top: 7), child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0))
            ),
            onPressed: () {
              isAdmin = false;
              Get.to(const NavigationMenu());
            },
            child: const Text(
              'Login', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              )
            ),
          )),
          Padding(padding: const EdgeInsets.only(top: 7), child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0))
            ),
            onPressed: () {
              isAdmin = true;
              Get.to(const NavigationMenu());
            },
            child: const Text(
              'Admin Login', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              )
            ),
          )),
          Padding(padding: const EdgeInsets.only(top: 7), child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0))
            ),
            onPressed: () {
              isAdmin = false;
              Get.to(const NavigationMenu());
            },
            child: const Text(
              'User Login', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              )
            ),
          )),
        ],
      ),
    );
  }
}
