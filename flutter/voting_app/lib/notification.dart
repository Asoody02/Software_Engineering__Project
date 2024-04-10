import 'package:http/http.dart' as http;
import 'dart:convert';

void sendNotification(String token, String title, String body) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:5000/send_notification'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'token': token,
      'title': title,
      'body': body,
    }),
  );

  if (response.statusCode == 200) {
    // print('Notification sent successfully');
  } else {
    // print('Failed to send notification: ${response.body}');
  }
}
