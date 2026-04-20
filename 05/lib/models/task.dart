class Task {
  final int id;
  final String title;
  final bool completed;

  Task({required this.id, required this.title, required this.completed});

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        completed: json['completed'] ?? false,
      );
}
