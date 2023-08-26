class Task {
  late int id;
  late String title;
  late int studentId;
  late String createdAt;
  late String updatedAt;
  late bool isDone;

  Task();

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    studentId = json['student_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDone = json['is_done'];
  }
}
