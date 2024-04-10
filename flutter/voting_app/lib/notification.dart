import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

void sendNotification(String token, String title, String body) async {
  await _firebaseMessaging.send(
    RemoteMessage(
      data: {
        'title': title,
        'body': body,
      },
      to: token,
    ),
  );
}
