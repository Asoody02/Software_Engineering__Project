import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:voting_app/poll.dart';
import 'package:voting_app/organization.dart';
import 'package:voting_app/customTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Global variables
late bool isAdmin;

// Global variables below are ONLY for testing. Please DELETE them once backend is fully integrated!
int currentPoll = 0;
int currentOrganization = 0;

final List<Poll> testPolls = [
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
    description: 'This poll attempts to query our audience on their opinion on the industry of dirt digging. Every member of our blah blah blah digs much blah blah every blah afternoon. But thats not all!!\n\n\n\n\n\n(it is.)',
    organizationName: 'Dirt Digger Inc.', 
    name: 'When Should We Dig Dirt?', 
    status: 'Completed',
    questions: [['How is your day?', []], ['How ugly are you?', ['2003 icon (whatever that means)', 'pretty fucking ugly']]]
  )
];

final List<List<dynamic>> testPollsAnswers = [
  [1, 'the ugliest model on the runway is still a model <33'],
  ['terrible. thanks for asking!1!', 1]
];

final List<String> adminTestPollAnswers = [
  'hehehe im a test answer (so mischievous >:) )',
  'i am but a wee test answer but i need to be pretty long so i can test that the text wrap is working properly. truly what a woeful job it is to have been bestowed upon mine countenance. earnestly I wish for thoust most testable of inputs.',
  'b-b-but do we really need to test...? :,('
];

final List<Organization> testOrganizations = [
  Organization(
    id: 0, 
    name: 'Jolly Bean Joy Co.', 
    description: 'Welcome to the Jiggly Jolly Bean Family!! Here we offer a whopping 2 DAYS annually of paid vacation! and if that sounded too good to be true its because it is!',
    isFollowed: true
  ),
  Organization(
    id: 1, 
    name: 'Chocobo Wranglers Inc.', 
    description: 'this is a test description............or is it? (it is.)',
    isFollowed: false
  )
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: customTheme,
      title: 'Policy Vote',
      home: const LoginPage(),
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
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 15), 
            child: Text(
              'Policy Vote Login',
              style: TextStyle(
                color: Color(0xFF5AC7F0),
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 7.5, left: 12, right: 12), 
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFC7E7F3)),
                ),
                hintText: 'Username',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 7.5, bottom: 12, left: 12, right: 12), 
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFC7E7F3)),
                ),
                hintText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7), 
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0)),
              ),
              onPressed: () {
                isAdmin = false;
                Get.to(const NavigationMenu());
              },
              child: const Text(
                'Login', 
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Below are the admin and user login buttons ONLY FOR TESTING. Please DELETE AFTER PROPER LOGIN IMPLEMENTATION.
          Padding(
            padding: const EdgeInsets.only(top: 7), 
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0)),
              ),
              onPressed: () {
                isAdmin = true;
                Get.to(const NavigationMenu());
              },
              child: const Text(
                'Admin Login', 
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7), 
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0)),
              ),
              onPressed: () {
                isAdmin = false;
                Get.to(const NavigationMenu());
              },
              child: const Text(
                'User Login', 
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
