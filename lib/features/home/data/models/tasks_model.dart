class TasksResponseModel {
  TasksResponseModel({
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? image;
  final String? title;
  final String? desc;
  final String? priority;
  final String? status;
  final String? user;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? v;

  factory TasksResponseModel.fromJson(Map<String, dynamic> json){
    return TasksResponseModel(
      id: json["_id"],
      image: json["image"],
      title: json["title"],
      desc: json["desc"],
      priority: json["priority"],
      status: json["status"],
      user: json["user"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}
