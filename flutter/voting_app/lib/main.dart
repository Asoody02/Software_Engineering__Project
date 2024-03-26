import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
  GetMaterialApp( // Use GetMaterialApp for GetX features
    home: LoginPage(),
  ),
);

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

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
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Login'),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => login(usernameController.text, passwordController.text),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}