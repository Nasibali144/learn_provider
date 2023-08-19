class Todo {
  int id;
  String title;
  String description;
  bool isCompleted;

  Todo({required this.id, required this.title, required this.description, required this.isCompleted});

  @override
  int get hashCode => Object.hash(id, title);

  @override
  bool operator ==(Object other) {
    return other is Todo &&
        other.title == title &&
        other.id == id;
  }
}
