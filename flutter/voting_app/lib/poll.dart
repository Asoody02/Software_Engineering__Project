class Poll {
  final int id;
  final String organizationName;
  final String name;
  final String description;
  final List<List<dynamic>> questions;
  bool haveVoted = false;
  String status;

  Poll({
    required this.id,
    required this.organizationName,
    required this.name,
    required this.description, 
    required this.questions,
    required this.status,
  });
}