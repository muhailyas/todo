class Todo {
  String? id;
  String title;
  String description;
  final bool isCompleted;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['is_completed'],
      );
  }
}
