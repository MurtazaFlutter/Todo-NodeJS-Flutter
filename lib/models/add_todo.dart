import 'dart:convert';

TodoModel loginModelFromJson(String str) =>
    TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  TodoModel({
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  final String title;
  final String description;
  final bool isCompleted;
  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
      title: json["title"],
      description: json["description"],
      isCompleted: json['isCompleted']);

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "isCompleted": isCompleted,
      };
}
