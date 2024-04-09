import 'dart:convert';
import 'package:http/http.dart' as http;

class PollService {
  final String baseUrl = 'http://10.0.2.2:5000'; // Change this to your actual Flask API URL

  Future<List<dynamic>> getPolls() async {
    final response = await http.get(Uri.parse('$baseUrl/polls'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load polls');
    }
  }

  Future<dynamic> getPollById(int pollId) async {
    final response = await http.get(Uri.parse('$baseUrl/polls/$pollId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      return {'message': 'Poll not found'};
    } else {
      throw Exception('Failed to load poll');
    }
  }
}