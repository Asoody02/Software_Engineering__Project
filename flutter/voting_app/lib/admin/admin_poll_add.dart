import 'package:flutter/material.dart';
import 'package:voting_app/admin/poll_add_widgets/admin_question_edit.dart';
import 'package:voting_app/confirmation_alert.dart';
import 'package:voting_app/navigation_menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminPollAdd extends StatefulWidget {
  AdminPollAdd({Key? key}) : super(key: key);

  @override
  State<AdminPollAdd> createState() => _AdminPollAddState();
}

class _AdminPollAddState extends State<AdminPollAdd> {
  final TextEditingController _pollNameController = TextEditingController();
  final TextEditingController _pollDescriptionController = TextEditingController();
  final List<GlobalKey<QuestionEditState>> _questionKeys = [];

  int questionNumber = 1;

  void _addQuestion() {
    setState(() {
      _questionKeys.add(GlobalKey<QuestionEditState>());
      questionNumber++;
    });
  }
   List<Map<String, dynamic>> getAllQuestionsData() {
    return _questionKeys
        .map((key) => key.currentState!.getQuestionData())
        .toList();
  }

  Future<void> uploadPoll() async {
    List<Map<String, dynamic>> questionsData = getAllQuestionsData();
    final url = Uri.parse('http://10.0.2.2:5000/create_poll'); // Replace with your actual Flask API URL
    final headers = {"Content-Type": "application/json"};
    final body = json.encode({
      "pollname": _pollNameController.text,
      "polldescription": _pollDescriptionController.text,
      "questions": questionsData,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        // Handle success
        print("Poll uploaded successfully");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Poll uploaded successfully.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Handle server error
        print("Failed to upload poll: ${response.body}");
      }
    } catch (e) {
      // Handle network error
      print("Error uploading poll: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Poll'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _pollNameController,
              decoration: InputDecoration(
                labelText: 'Poll Name',
              ),
            ),
            TextField(
              controller: _pollDescriptionController,
              decoration: InputDecoration(
                labelText: 'Poll Description',
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: questionNumber,
              itemBuilder: (context, index) {
                return QuestionEdit(questionNumber: index + 1, onPressed: null); // Your QuestionEdit widget here
              },
            ),
            ElevatedButton(
              onPressed: _addQuestion,
              child: Text('Add Question'),
            ),
            ElevatedButton(
              onPressed: uploadPoll,
              child: Text('Upload Poll'),
            ),
          ],
        ),
      ),
    );
  }
}