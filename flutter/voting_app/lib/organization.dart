class Organization {
  final int id;
  final String name;
  final String description;
  bool isFollowed;

  Organization({
    required this.id,
    required this.name,
    required this.description,
    required this.isFollowed
  });
}