import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:http/http.dart' as http;

//global variables
late bool isAdmin;

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Policy Vote',
      home: LoginPage()
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(String username, String password) async {
    var requestBody = {'username': username, 'password': password};

    // Print the JSON-encoded request body
    var response = await http.post(
      Uri.parse('http://10.0.2.2:5000/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var isAdmin = data['isAdmin'];
      Get.to(() => const NavigationMenu()); // Make sure Get.to() is properly used
    } else {
      Get.snackbar('Login Failed', 'Invalid username or password',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

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
          const Padding(padding: EdgeInsets.only(top: 7.5, left: 12, right: 12), child: TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC7E7F3))),
                hintText: 'Username',
            )
          )),
          const Padding(padding: EdgeInsets.only(top: 7.5, bottom: 12, left: 12, right: 12), child: TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC7E7F3))),
                hintText: 'Password',
            ),
            obscureText: true
          )),
          Padding(padding: const EdgeInsets.only(top: 7), child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0))
            ),
            onPressed: () => login(usernameController.text, passwordController.text),
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

          //below are the admin and user login buttons ONLY FOR DEBUGGING PLEASE DELETE AFTER PROPER LOGIN IMPLEMENTATION
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