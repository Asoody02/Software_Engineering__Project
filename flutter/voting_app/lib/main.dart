//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:voting_app/poll.dart';
import 'package:voting_app/organization.dart';
import 'package:voting_app/customTheme.dart';
//import 'package:voting_app/splashScreen.dart'; we can add this back in last
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
    description: 'Poll to decide most suitable date for employee group training.',
    organizationName: 'Dirt Digger Inc.', 
    name: 'Employee Training Dates', 
    status: 'Ongoing',
    questions: [['Have you registered for employee training?', ['Yes', 'No']], ['Have you filled out your on-site waiver?', ['Yes', 'No']]]
  ),
  Poll(
    id: 1,
    description: 'This poll attempts to query our employees on their opinion on the industry of dirt excavation. We want to know how to improve your experience at Dirt Digger Inc.',
    organizationName: 'Dirt Digger Inc.', 
    name: 'Your Opinons on Excavation', 
    status: 'Completed',
    questions: [['Have you participated in an excavation job in the past 30 days?', ['Yes', 'No']], ['If yes, was this your first excavation job?', ['Yes, it was my first time participating in an excavation', 'No, I have particpated in an excavation before','I have spectated, but not participated in an excavation']]]
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
    description: 'Welcome to the Jiggly Jolly Bean Family!! We strive to bring you quality jellybeans based on our famous family recipe!',
    isFollowed: true
  ),
  Organization(
    id: 1, 
    name: 'Chocobo Wranglers Inc.', 
    description: 'You lose your Chocobo, we wrangle them!',
    isFollowed: false
  )
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( //needed this information to make firebase not null
    options: FirebaseOptions(
      apiKey: "AIzaSyAwJTIj74xjjkiZrZJ5xSi-2DRXLMsJwQk", 
      appId: "1:838527174327:android:f924bbc6f77659279f2f32", 
      messagingSenderId: "838527174327", //project number
      projectId: "policyvote-688dc")
  );
  runApp(const Login());
}
// ignore: use_key_in_widget_constructors
class Noti extends StatefulWidget {
  @override
  Notif createState() => Notif();
}
class Notif extends State<Noti> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? _token;
  @override
  void initState() {
    super.initState();
    _getToken();
    _firebaseMessaging.subscribeToTopic('all');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Notification received: ${message.notification?.body}");
      // Handle the notification
    });
  }
  Future<void> _getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    setState(() {
      _token = token;
    });
    print('FCM Token: $_token');
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
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