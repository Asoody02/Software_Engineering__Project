import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:voting_app/poll.dart';

//global variables
late bool isAdmin;
int currentPoll = 0;
final List<Poll> debugPolls = [
  Poll(
    id: 0,
    description: 'Cupiditate earum maxime qui. Recusandae delectus quo a nihil facilis corrupti doloribus assumenda. Sed vel consequuntur id quia ut molestiae porro animi.Consequatur esse harum repudiandae necessitatibus deleniti odit. Aut suscipit non aut voluptas ad omnis nostrum incidunt. Non sequi eveniet autem sed maiores et culpa. Quidem totam et quia et impedit.',
    organizationName: 'Dirt Digger Inc.', 
    name: 'How Much Dirt to Dig?', 
    status: 'Ongoing',
    questions: [['How is your day?', ['Good', 'Bad', 'meh']], ['How ugly are you?', []]]
  ),
  Poll(
    id: 1,
    description: 'description',
    organizationName: 'Dirt Digger Inc.', 
    name: 'When Should We Dig Dirt?', 
    status: 'Completed',
    questions: [['How is your day?', []], ['How ugly are you?', ['2003 icon (whatever that means)', 'pretty fucking ugly']]]
  )
];

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
          const Padding(padding: EdgeInsets.symmetric(vertical: 15), child: Text( //trinity: needs padding fix
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
