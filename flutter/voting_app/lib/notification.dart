import 'package:http/http.dart' as http;

class Notif{
  static const String baseUrl = 'http://127.0.0.1:5000';
  static Future<void> sendNotification(String token, String title, String body) async {
    const url = '$baseUrl/send-notification';
    final response = await http.post(
      Uri.parse(url),
      body: {'token': token, 'title': title, 'body': body},
    );
    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification');
  }
}
}