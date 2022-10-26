class Note {
  int id;
  String title;
  String description;
  int priority;
  String data;
  Note(
      {required this.id,
      required this.title,
      required this.description,
      required this.priority,
      required this.data});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> note = {};
    note['id'] = id;
    note['title'] = title;
    note['description'] = description;
    note['priority'] = priority;
    note['data'] = data;
    return note;
  }

  @override
  toString() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority,
      'data': data,
    }.toString();
  }
}
