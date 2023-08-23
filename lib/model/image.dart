class StudenImage {
  late int id;
  late String image;
  late int studentId;
  late String imageUrl;

  StudenImage();

  StudenImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    studentId = json['student_id'];
    imageUrl = json['image_url'];
  }
}
