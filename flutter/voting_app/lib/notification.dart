import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendNotification(String title, String body) async {
  final url = Uri.parse('http://127.0.0.1:5000/send_notification');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'title': title,
      'body': body,
    }),
  );

  if (response.statusCode == 200) {
    print('Notification sent successfully');
  } else {
    print('Failed to send notification: ${response.body}');
  }
}